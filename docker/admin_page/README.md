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

   HOME SERVER ADM
   ────────────────────────────

   Frontend
   HTML + CSS + JS mínimo

   Backend
   Flask

   Autenticação
   Flask-Login

   Senha
   Werkzeug Security

   Sessão
   Flask Session

   Proteção
   Secure + HttpOnly + SameSite

   Brute Force
   Rate limiting / bloqueio temporário

   Logs
   Python logging / Flask logger

   Documentação
   Markdown

   Execução
   Docker

   Exposição
   Cloudflare Tunnel

Sem banco.
Sem Redis.
Sem autenticação externa.
Sem Keycloak.
Sem OAuth.
Sem Zero Trust.


## AUTENTICAÇÃO PARA ACESSO A PÁGINA:

- Flask → aplicação
- Flask-Login → gerenciamento da sessão/login
- Werkzeug Security → hash seguro da senha
- session cookie do Flask → manter o usuário autenticado
- HTTPS pelo Cloudflare Tunnel → proteção do tráfego
- senha forte armazenada somente como hash, nunca em texto
- O próprio tutorial oficial do Flask usa generate_password_hash() e check_password_hash() para armazenamento/verificação de senhas, e as sessões do Flask são assinadas para impedir adulteração pelo cliente.

A senha real não deve entrar no Git.

O que teremos é algo como:
ADMIN_USERNAME=tadeu
ADMIN_PASSWORD_HASH=...
SECRET_KEY=...
em um arquivo .env que fica fora do repositório.

O hash pode ser gerado pelo próprio Werkzeug.
O Flask documenta generate_password_hash() para gerar o hash e check_password_hash() para verificar a senha fornecida.

O Flask-Login fornece mecanismos como login_required para proteger essas rotas.
E ele também possui mecanismos de proteção de sessão; por exemplo, a documentação descreve os modos basic e strong de session protection.

Login
  ↓
Sessão criada
  ↓
Inatividade por X minutos
  ↓
Logout

- Não queremos que o Flask aceite milhares de tentativas.
Podemos implementar uma política simples:

5 tentativas erradas
        ↓
bloqueio temporário
        ↓
15 minutos
        ↓
pode tentar novamente

E registrar:
2026-08-21 11:42
Login falhou
IP: xxx.xxx.xxx.xxx

# Configuração importante do Flask
# Precisaremos configurar corretamente os cookies da sessão:
Secure
HttpOnly
SameSite

Especialmente:
Secure = True
HttpOnly = True
SameSite = Lax

Isso significa, em termos práticos:
Secure → cookie somente via HTTPS
HttpOnly → JavaScript da página não consegue ler o cookie
SameSite → reduz determinados ataques envolvendo envio cross-site

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