#!/bin/bash
git clone https://github.com/letsencrypt/letsencrypt
letsencrypt/letsencrypt-auto certonly  --domains *.okd.lamit.win --email okd@lamit.win --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
 --- or ---
git clone https://github.com/certbot/certbot 
certbot/certbot-auto certonly -d oocp.lamit.win
certbot/certbot-auto certonly -d okd.lamit.win
