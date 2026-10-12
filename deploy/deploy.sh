#!/usr/bin/env bash
# Publish the site to dabox: the HTML files into /srv/site/site, the Caddy file into
# /etc/caddy/sites. If Caddy rejects the new file, the previous one is put back.
set -euo pipefail
cd "$(dirname "$0")/.."

tar -czf - index.html privacy.html | ssh dabox 'set -e
  sudo mkdir -p /srv/site
  sudo rm -rf /srv/site/site.new
  sudo mkdir /srv/site/site.new
  sudo tar -xzf - -C /srv/site/site.new
  sudo chmod -R a+rX /srv/site/site.new
  sudo rm -rf /srv/site/site.old
  if [ -d /srv/site/site ]; then sudo mv /srv/site/site /srv/site/site.old; fi
  sudo mv /srv/site/site.new /srv/site/site'

ssh dabox 'set -e
  sudo tee /tmp/site.caddy >/dev/null
  if [ -f /etc/caddy/sites/site.caddy ]; then sudo cp /etc/caddy/sites/site.caddy /tmp/site.caddy.bak; fi
  sudo mv /tmp/site.caddy /etc/caddy/sites/site.caddy
  if sudo caddy validate --config /etc/caddy/Caddyfile --adapter caddyfile; then
    sudo systemctl reload caddy
  else
    if [ -f /tmp/site.caddy.bak ]; then sudo mv /tmp/site.caddy.bak /etc/caddy/sites/site.caddy; else sudo rm -f /etc/caddy/sites/site.caddy; fi
    echo "Caddy rejected the new site file; previous one restored" >&2
    exit 1
  fi' < deploy/site.caddy
echo "Live: https://marcosbatistaochoa.com"
