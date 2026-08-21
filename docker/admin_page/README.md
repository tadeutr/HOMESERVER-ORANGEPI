## PÁGINA WEB PARA ADMINISTRAÇÃO DO SERVIDOR HOME SERVER (ORANGE PI)

                 adm.trisystem.com.br
                         │
              ┌──────────┴──────────┐
              │   🔐 AUTENTICAÇÃO   │
              └──────────┬──────────┘
                         │
              HOME SERVER — ADMIN
                         │
       ┌─────────────────┼─────────────────┐
       │                 │                 │
    🐳 Docker          🗄 Banco          🖥 Sistema
       │                 │                 │
   Portainer         CloudBeaver        SSH Web ttyd
       │                                   │
       └───────────────────────────────────
                         │
                    📚 Manual
                    🛠 Soluções
                    💾 Backup
                    🚨 Problemas

# BIBLIOTECA PYTHON = FLASK (https://flask.palletsprojects.com/en/stable/) + Gunicorn

## Status na página principal:

HOME SERVER
────────────────────────────────────

🟢 Cloudflare Tunnel       ONLINE
🟢 MySQL                   ONLINE
🟢 CloudBeaver             ONLINE
🟢 Portainer               ONLINE
🟢 Rico Trade System       ONLINE

────────────────────────────────────

CPU          12%
RAM          1.8 / 4.0 GB
SSD          37 GB / 128 GB
UPTIME       14d 03h

- Isso o Flask consegue consultar diretamente no servidor.
- E não precisa de banco de dados para isso.


## Stack

- Componente	Tecnologia
- Painel ADM	Flask
- Servidor WSGI	Gunicorn
- Frontend	HTML + CSS + JS mínimo
- Documentação	Markdown
- Markdown → HTML	biblioteca Python simples
- Terminal Web	ttyd
- Banco	nenhum inicialmente
- Persistência ADM	arquivos/Git
- Exposição	Cloudflare Tunnel
- Containers	Docker Compose

## Fase 1 — ADM 1.0

Login
   ↓
Dashboard
   ↓
Links:
• CloudBeaver
• Portainer
• RTS
• SSH

Manual.md
Troubleshooting.md
Recovery.md

## Fase 2

🟢 status dos containers
🟢 CPU
🟢 RAM
🟢 SSD
🟢 uptime

## Fase 3

💾 último backup
🐳 containers
☁️ Cloudflare
🗄 MySQL