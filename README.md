# BrandWise Business Solutions — Website

The website for **BrandWise Business Solutions Limited** (BBS), Lusaka, Zambia.
*Where Innovation Meets Delivery.*

## What's here

| Path | What it is |
|---|---|
| `index.html` | The whole site: page, styles and scripts |
| `assets/bbs-icon.png`, `assets/bbs-logo.png` | BBS logo (transparent) |
| `assets/work/` | Social media design samples shown in the gallery |
| `assets/profiles/` | Company profile sample pages |
| `serve.ps1` | Local preview server only (not needed for hosting) |

## Preview locally

```powershell
powershell -ExecutionPolicy Bypass -File serve.ps1
```

Then open http://localhost:8080.

## Hosting

It's a static site, so any static host works (Netlify, Cloudflare Pages, GitHub Pages).
Publish the repository root; there's no build step.
