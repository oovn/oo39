#!/bin/bash
git clone https://github.com/certbot/certbot 
certbot/certbot-auto certonly -d oocp.lamit.win
certbot/certbot-auto certonly -d okd.lamit.win
