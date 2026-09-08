# kurtjones.co.uk

Portfolio site for Kurt Jones — Director & DOP.
Static site, deployed to Cloudflare Workers.

## Editing

Everything lives in `index.html`. To add or change a film, edit the `WORK`
array near the bottom of that file:

```js
{ title:'Piece name',
  meta:'Credit line',
  youtube:'VIDEO_ID',      // '' shows a "Coming soon" badge
  poster:'image.jpg' }     // omit to use the YouTube thumbnail
```

Pushing to `main` deploys automatically.

## Files

| File | Purpose |
|---|---|
| `index.html` | The whole site — markup, styles, script |
| `poster-newbalance.jpg` | Poster frame for the New Balance tile |
| `_headers` | Security headers applied by Cloudflare |
| `robots.txt` / `sitemap.xml` | Search engine basics |
