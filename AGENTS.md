# site

Marcos's personal website, `marcosbatistaochoa.com`. Status (2026-10-12):
minimum version, a home page and the privacy policy Google requires for the
budget app's sign-in. The full site comes later.

## Rules

- Static files only (`index.html`, `privacy.html`), self-hosted on dabox
  by Caddy (the user's choice, 2026-10-12: full control, no host in
  between). Publish with `bash deploy/deploy.sh`: files to
  `/srv/site/site`, `deploy/site.caddy` to `/etc/caddy/sites/site.caddy`,
  previous file restored if Caddy rejects the new one. Same pattern as
  `adriana-letter/deploy/`.
- Not yet in `ai-system/server/setup.sh`: a dabox rebuild loses the site
  until `deploy/deploy.sh` is rerun. Fold in when dabox is rebuilt
  (ai-system STATE.md item 1).
- DNS is at Cloudflare (the user's account): A `@` and A `www` ->
  15.204.235.7, "DNS only" (grey cloud) so Caddy gets the certificate.
  Each app gets its own subdomain on dabox.
- `privacy.html` must match what the apps actually do. Change an app's data
  use, change this page in the same piece of work.
- No secrets, no AIER data, nothing private about anyone.
