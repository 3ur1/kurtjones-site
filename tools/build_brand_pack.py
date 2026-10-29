# Builds brand/brand-pack.html, the visual brand identity pack, from the real brand files.
# Run from the repo root:  python -I tools/build_brand_pack.py
import base64, os, re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
B = os.path.join(ROOT, 'brand')

def rd(name):
    return open(os.path.join(B, name), encoding='utf-8').read().strip()

def inline(svg, cls, label):
    svg = re.sub(r'<title>.*?</title>', '', svg)
    svg = re.sub(r'aria-label="[^"]*"', 'aria-label="%s"' % label, svg, count=1)
    return svg.replace('<svg ', '<svg class="%s" ' % cls, 1)

def b64(path):
    return base64.b64encode(open(path, 'rb').read()).decode()

m_rev, m_pos = rd('kj-mark-reversed.svg'), rd('kj-mark-positive.svg')
m_w, m_b = rd('kj-mark-mono-white.svg'), rd('kj-mark-mono-black.svg')
l_rev, l_pos = rd('kj-lockup-reversed.svg'), rd('kj-lockup-positive.svg')
fav = open(os.path.join(ROOT, 'public', 'assets', 'favicon.svg'), encoding='utf-8').read()
fav_uri = 'data:image/svg+xml;base64,' + base64.b64encode(fav.encode()).decode()
og = b64(os.path.join(B, 'og-image.png'))
touch = b64(os.path.join(B, 'apple-touch-icon.png'))

sizes = ''.join(
    '<figure class="size"><div style="width:%dpx;height:%dpx">%s</div><figcaption>%d px</figcaption></figure>'
    % (s, s, inline(m_rev, 'm', 'Monogram at %d pixels' % s), s) for s in (16, 24, 32, 48, 96))

SWATCHES = [
    ('Ink', '#0b0b0c', 'Page background', '', ''),
    ('Panel', '#151517', 'Cards, raised surfaces', '', ''),
    ('Raised', '#1d1d20', 'Hover, diagram fills', '', ''),
    ('Line', '#2c2c30', 'Dividers only', '1.41', 'dec'),
    ('Control', '#6b6a66', 'Field and box outlines', '3.63', 'ui'),
    ('Meta', '#85847e', 'Small print, dates', '5.25', 'aa'),
    ('Ash', '#97968f', 'Labels, eyebrows', '6.63', 'aa'),
    ('Fog', '#bdbcb7', 'Body text', '10.34', 'aa'),
    ('Paper', '#f3f2ef', 'Headings, logo', '17.57', 'aa'),
    ('Tally', '#ff5247', 'The live point only', '6.14', 'aa'),
]
CHIP = {'aa': '<span class="pass">AA text</span>', 'ui': '<span class="pass">3:1 UI</span>',
        'dec': '<span class="na">Decorative</span>'}
swatches = ''.join(
    '<div class="sw"><div class="chipc" style="background:%s"></div><div class="swb"><b>%s</b><code>%s</code>'
    '<span>%s</span><span class="cr">%s%s</span></div></div>'
    % (h, n, h, r, (c + ' on Ink ') if c else '', CHIP.get(k, '')) for n, h, r, c, k in SWATCHES)

page = open(os.path.join(ROOT, 'tools', 'brand_pack_template.html'), encoding='utf-8').read()
for key, val in {
    '{{LOCKUP_TOP}}': inline(l_rev, 'lk', 'Kurt Jones'),
    '{{M_REV}}': inline(m_rev, 'm', 'Reversed monogram'),
    '{{M_POS}}': inline(m_pos, 'm', 'Positive monogram'),
    '{{M_W}}': inline(m_w, 'm', 'One colour white monogram'),
    '{{M_B}}': inline(m_b, 'm', 'One colour black monogram'),
    '{{L_REV}}': inline(l_rev, 'lk', 'Reversed lockup'),
    '{{L_POS}}': inline(l_pos, 'lk', 'Positive lockup'),
    '{{SIZES}}': sizes,
    '{{M_CLEAR}}': inline(m_rev, 'm', 'Monogram with clear space'),
    '{{SWATCHES}}': swatches,
    '{{FAV_URI}}': fav_uri,
    '{{TOUCH}}': touch,
    '{{OG}}': og,
}.items():
    assert key in page, key
    page = page.replace(key, val)

out = os.path.join(B, 'brand-pack.html')
open(out, 'w', encoding='utf-8', newline='\n').write(page)
print(out, os.path.getsize(out), 'dashes:', len(re.findall('[–—]', page)))
