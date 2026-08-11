# CloudBeaver

## Objetivo

O CloudBeaver é o administrador web oficial da DBeaver Team.

Neste projeto ele substitui completamente o MySQL Workbench para administração remota do banco de dados.

Todo o acesso será realizado via navegador através do Cloudflare Tunnel, sem necessidade de VPN, Tailscale ou abertura da porta 3306 para a Internet.

---

# Arquitetura

```
Internet
      │
Cloudflare Tunnel
      │
db.trisystem.com.br
      │
CloudBeaver
      │
Docker Network (homeserver)
      │
MySQL
```

O banco MySQL permanece acessível apenas pela rede Docker.

A porta 3306 **não deve ser publicada no host**.

---

# Estrutura

```
docker/
└── cloudbeaver/
    ├── docker-compose.yml
    └── README.md
```

Volume persistente:

```
/Docker/volumes/cloudbeaver
```

---

# Deploy

Subir o serviço:

```bash
docker compose up -d
```

Parar:

```bash
docker compose down
```

Atualizar imagem:

```bash
docker compose pull
docker compose up -d
```

Verificar logs:

```bash
docker logs -f cloudbeaver
```

Verificar status:

```bash
docker ps
```

---

# Persistência

Toda configuração do CloudBeaver é armazenada em:

```
/Docker/volumes/cloudbeaver
```

Em caso de atualização do container, nenhuma configuração será perdida.

---

# Acesso

Localmente:

```
http://cloudbeaver:8978
```

Produção:

```
https://db.trisystem.com.br
```

(Será publicado através do Cloudflare Tunnel.)

---

# Segurança

Esta arquitetura foi projetada para que:

- MySQL nunca fique exposto na Internet.
- Porta 3306 permaneça fechada.
- Todo acesso externo ocorra exclusivamente pelo Cloudflare Tunnel.
- O CloudBeaver possua autenticação própria.
- Futuramente o acesso será protegido também pelo Cloudflare Zero Trust (dupla autenticação).

---

# Banco de Dados

Servidor:

```
mysql
```

Porta:

```
3306
```

Rede:

```
homeserver
```

O CloudBeaver conecta ao MySQL utilizando o nome do container Docker.

---

# Backup

O CloudBeaver não armazena dados do banco.

O backup oficial do ambiente continua sendo realizado através dos scripts automáticos do MySQL.

O volume do CloudBeaver contém apenas:

- usuários
- conexões
- preferências
- configurações

---

# Atualizações

Atualizar a imagem:

```bash
docker compose pull
docker compose up -d
```

Nunca remover o volume:

```
/Docker/volumes/cloudbeaver
```

---

# Filosofia do Projeto

O Home Server foi projetado para ser simples de administrar por uma equipe de uma pessoa.

Por este motivo optou-se por utilizar:

- Docker Compose
- Cloudflare Tunnel
- CloudBeaver

em substituição ao uso de VPN e MySQL Workbench.

Toda a infraestrutura é reconstruível apenas através do repositório Git.

---

# Roadmap

Concluído:

- Docker
- Portainer
- MySQL
- Backup Automático
- Cloudflare Tunnel
- CloudBeaver

Próximos passos:

- Cloudflare Zero Trust
- Terminal SSH via navegador
- TripoliPy API
- Migração completa do TripoliPy para API