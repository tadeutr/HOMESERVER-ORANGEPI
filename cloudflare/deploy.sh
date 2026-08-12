#!/bin/bash

echo "Atualizando Cloudflare Tunnel..."
sudo cp cloudflare/config.yml /etc/cloudflared/config.yml

echo "Reiniciando Cloudflare..."
sudo systemctl restart cloudflared

echo "Pronto!"