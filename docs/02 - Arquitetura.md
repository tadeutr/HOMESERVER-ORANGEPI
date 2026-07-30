# Arquitetura

Este documento define a arquitetura lógica do Home Server Orange Pi.

O objetivo é construir uma infraestrutura modular, organizada e de fácil manutenção, baseada em Docker e preparada para futuras expansões.

---

# Visão Geral

A arquitetura será composta pelas seguintes camadas:

```
                Internet
                    │
                    ▼
            Cloudflare DNS
                    │
                    ▼
          Cloudflare Tunnel
                    │
                    ▼
         Ubuntu Server 24.04 LTS
                    │
                    ▼
             Docker Engine
                    │
        ┌───────────┴───────────┐
        │                       │
        ▼                       ▼
  Infraestrutura          Aplicações
```

---

# Camada 1 — Sistema Operacional

Responsável por fornecer a base do servidor.

Componentes:

- Armbian Ubuntu 26.04 LTS Minimal
- SSH
- Firewall UFW
- Atualizações
- Gerenciamento de usuários

Nesta camada não serão instalados serviços de aplicação.

---

# Camada 2 — Docker

Toda a infraestrutura será executada em containers.

Benefícios:

- isolamento;
- facilidade de atualização;
- backups simplificados;
- migração rápida;
- reinstalação simples.

---

# Camada 3 — Infraestrutura

Serviços responsáveis pelo funcionamento do ambiente.

Containers previstos:

- Portainer
- Cloudflared
- Uptime Kuma
- Watchtower

Esses containers dão suporte às aplicações.

---

# Camada 4 — Aplicações

Serviços utilizados no dia a dia.

Containers previstos:

- MySQL
- Rico Trade System
- Nextcloud

No futuro poderão ser adicionados novos serviços.

---

# Fluxo de Acesso

O acesso ao servidor ocorrerá conforme o fluxo abaixo.

```
Internet

↓

Cloudflare

↓

Cloudflare Tunnel

↓

Docker

↓

Aplicação
```

Nenhuma porta será aberta diretamente no roteador.

Todo acesso externo será realizado através do Cloudflare Tunnel.

---

# Organização dos Dados

Os dados serão separados dos containers.

Estrutura prevista:

```
/srv

├── docker/
│
├── mysql/
│
├── nextcloud/
│
├── backups/
│
└── logs/
```

Os containers poderão ser removidos e recriados sem perda dos dados.

---

# Organização Docker

Cada serviço possuirá seu próprio diretório.

Exemplo:

```
compose/

├── mysql/
│   ├── docker-compose.yml
│   └── .env
│
├── portainer/
│   ├── docker-compose.yml
│   └── .env
│
├── nextcloud/
│   ├── docker-compose.yml
│   └── .env
│
└── ricotradesystem/
    ├── docker-compose.yml
    └── .env
```

Cada serviço poderá ser iniciado independentemente.

---

# Banco de Dados

Será utilizado um único container MySQL.

Dentro dele existirão múltiplos schemas.

```
MySQL

├── bd_tripolipy

└── bd_ricotradesys
```

Essa abordagem reduz consumo de recursos e facilita backups.

---

# Comunicação entre Containers

A comunicação ocorrerá através de redes Docker.

Inicialmente serão utilizadas duas redes:

```
frontend
```

Responsável pelos serviços acessíveis via web.

```
backend
```

Responsável pela comunicação interna entre containers.

Exemplo:

Rico Trade System

↓

backend

↓

MySQL

Sem exposição direta do banco.

---

# Persistência

Todo serviço que armazenar dados utilizará volumes persistentes.

Exemplos:

- banco MySQL;
- arquivos do Nextcloud;
- configurações do Portainer;
- dados do Uptime Kuma.

---

# Backup

A estratégia de backup contemplará:

- dump diário do MySQL;
- cópia das configurações Docker;
- backup dos arquivos do Nextcloud;
- retenção de múltiplas versões.

---

# Monitoramento

Serão utilizados:

- Uptime Kuma
- Watchtower

Objetivos:

- monitorar disponibilidade;
- acompanhar atualizações;
- reduzir manutenção manual.

---

# Escalabilidade

A arquitetura deverá permitir futura inclusão de novos serviços, como:

- Git Server
- VPN
- Home Assistant
- IA Local
- Grafana
- Prometheus
- Jellyfin
- MQTT
- Node-RED

Sem necessidade de alteração da estrutura principal.

---

# Princípios Arquiteturais

Este projeto seguirá os seguintes princípios:

- simplicidade;
- modularidade;
- isolamento entre serviços;
- documentação contínua;
- facilidade de backup;
- facilidade de recuperação;
- facilidade de migração.

---

# Objetivo Final

Construir uma infraestrutura estável, organizada e escalável, permitindo que qualquer serviço possa ser adicionado, atualizado ou removido com o mínimo impacto sobre os demais componentes.