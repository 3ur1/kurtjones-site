# kurtjones.co.uk

Portfolio site for Kurt Jones — Director & DOP.
Static site, deployed to Cloudflare Workers.

## Editing

Everything lives in `public/index.html`. To add or change a film, edit the `WORK`
array near the bottom of that file:

```js
{ title:'Piece name',
  meta:'Credit line',
  youtube:'VIDEO_ID',      // '' shows a "Coming soon" badge
  poster:'image.jpg',      // omit to use the YouTube thumbnail
  loop:true }              // optional — replays on end, for cyclical edits
```

With no `poster`, tile artwork falls back through the YouTube thumbnail sizes:
`maxresdefault` → `hq720` → `hqdefault`, then a typographic card. Only videos
uploaded at 720p or above have the first two, so the cascade matters — without
it those tiles render empty.

Pushing to `main` deploys automatically.

## Files

`wrangler.jsonc` at the repo root tells Cloudflare to serve `public/` as the site.


| File | Purpose |
|---|---|
| `public/index.html` | The whole site — markup, styles, script |
| `public/poster-newbalance.jpg` | Poster frame for the New Balance tile |
| `public/_headers` | Security headers applied by Cloudflare |
| `public/robots.txt` / `sitemap.xml` | Search engine basics |
