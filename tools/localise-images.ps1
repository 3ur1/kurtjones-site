# ---------------------------------------------------------------------------
#  Pull the site's remaining third-party images into the repo.
#
#  Finds every static.wixstatic.com image referenced by public\index.html,
#  downloads it to public\bts\, and repoints the HTML at the local copy.
#
#  Safe to re-run: once no remote images remain it reports that and stops.
#  Nothing is rewritten unless every download succeeded.
# ---------------------------------------------------------------------------

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot          # repo root
$html = Join-Path $root 'public\index.html'
$dir  = Join-Path $root 'public\bts'

if (-not (Test-Path $html)) { throw "Cannot find $html" }

$utf8 = New-Object System.Text.UTF8Encoding($false)   # no BOM
$text = [System.IO.File]::ReadAllText($html, $utf8)

$rx    = [regex]'https://static\.wixstatic\.com/media/[^"'']+'
$urls  = @()
foreach ($m in $rx.Matches($text)) {
  if ($urls -notcontains $m.Value) { $urls += $m.Value }   # keep document order
}

if ($urls.Count -eq 0) {
  Write-Host "No third-party images left. Nothing to do." -ForegroundColor Green
  exit 0
}

Write-Host "Found $($urls.Count) image(s) still hosted on Wix.`n"
New-Item -ItemType Directory -Force -Path $dir | Out-Null

# Download everything first. Only touch the HTML if all of them worked.
$map = @{}
$i = 0
foreach ($url in $urls) {
  $i++
  $ext  = if ($url -match '\.png') { '.png' } else { '.jpg' }
  $name = "bts-$i$ext"
  $dest = Join-Path $dir $name
  Write-Host ("[{0}/{1}] {2}" -f $i, $urls.Count, $name)
  try {
    Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing -TimeoutSec 60
  } catch {
    Write-Host "        DOWNLOAD FAILED: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "`nNothing was changed. The site still works." -ForegroundColor Yellow
    exit 1
  }
  $size = (Get-Item $dest).Length
  if ($size -lt 1024) {
    Write-Host "        Only $size bytes - that is not an image." -ForegroundColor Red
    Write-Host "`nNothing was changed. The site still works." -ForegroundColor Yellow
    exit 1
  }
  Write-Host ("        {0:N0} bytes" -f $size) -ForegroundColor Green
  $map[$url] = "bts/$name"
}

# Keep a copy of the original alongside, just in case.
Copy-Item $html "$html.bak" -Force

foreach ($url in $map.Keys) { $text = $text.Replace($url, $map[$url]) }
[System.IO.File]::WriteAllText($html, $text, $utf8)

$left = $rx.Matches($text).Count
Write-Host "`nRewrote $($map.Count) reference(s). Wix references remaining: $left" -ForegroundColor Green
if ($left -eq 0) {
  Write-Host "The site no longer depends on Wix for anything." -ForegroundColor Green
  Write-Host "Original saved as index.html.bak - delete it once you are happy."
  Write-Host "`nNext: run push.bat to put it live."
}
