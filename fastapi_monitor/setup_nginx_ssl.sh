#!/bin/bash

# Variável de domínio
DOMAIN="api.seudominio.com"

# Atualiza e instala nginx
sudo apt update && sudo apt install nginx -y

# Cria configuração Nginx
cat <<EOF | sudo tee /etc/nginx/sites-available/fastapi
server {
    listen 80;
    server_name $DOMAIN;

    location / {
        proxy_pass http://localhost:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
EOF

# Ativa configuração
sudo ln -s /etc/nginx/sites-available/fastapi /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl restart nginx

# Instala Certbot e configura HTTPS
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d $DOMAIN

echo "✅ Nginx e HTTPS configurados para $DOMAIN"
