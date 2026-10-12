# site

Marcos's personal website, `marcosbatistaochoa.com`. Status (2026-10-12):
minimum version, a home page and the privacy policy Google requires for the
budget app's sign-in. The full site comes later.

## Rules

- Static files only (`index.html`, `privacy.html`), served by GitHub Pages
  from `main` of `marcosbatistaochoa/site`. `CNAME` holds the domain; do not
  delete it.
- DNS is at Cloudflare (the user's account). The apex and `www` point at
  GitHub Pages and stay "DNS only" (grey cloud). Apps get their own
  subdomains pointed at dabox; the root site never moves there, so the
  privacy page stays up while dabox is rebuilt.
- `privacy.html` must match what the apps actually do. Change an app's data
  use, change this page in the same piece of work.
- No secrets, no AIER data, nothing private about anyone.
