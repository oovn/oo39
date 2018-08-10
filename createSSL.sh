#!/bin/bash
git clone https://github.com/certbot/certbot 
certbot/certbot-auto certonly --standalone --agree-tos --email binhbat@live.com -d oocp.lamit.win
certbot/certbot-auto certonly --webroot --agree-tos --email binhbat@live.com -d okd.lamit.win
