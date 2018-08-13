#!/bin/bash
git clone https://github.com/letsencrypt/letsencrypt
letsencrypt/letsencrypt-auto certonly  --domains *.okd.lamit.win --email okd@lamit.win --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
cd /etc/letsencrypt/live/okd.lamit.win-0001
oc secrets new router-certs tls.crt=/etc/letsencrypt/live/okd.lamit.win-0001/fullchain.pem tls.key=/etc/letsencrypt/live/okd.lamit.win-0001/privkey.pem -o json --type='kubernetes.io/tls' --confirm | oc replace -f -
