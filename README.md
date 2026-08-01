# HOMESERVER-ORANGEPI
# 🖥️ Home Server Orange Pi

PADRÃO DA SENHAS: NOME+ADESEMPRE+ARR 

Infraestrutura de servidor doméstico baseada em Orange Pi 4 Pro, Ubuntu Server, Docker e serviços auto-hospedados.

O objetivo deste projeto é construir um ambiente organizado, seguro e documentado para hospedar aplicações próprias, bancos de dados, arquivos pessoais e serviços web, utilizando conceitos de infraestrutura como código e boas práticas de DevOps.

---

# 📌 Objetivo do Projeto

Criar um Home Server pessoal com capacidade para:

- hospedar aplicações web;
- executar bancos de dados;
- disponibilizar armazenamento em nuvem privado;
- permitir acesso remoto seguro;
- automatizar backups;
- facilitar manutenção e expansão futura.

Este projeto será desenvolvido como uma documentação técnica completa, permitindo reconstrução ou migração da infraestrutura quando necessário.

---

# 🖥️ Hardware

## Orange Pi 4 Pro

| Componente | Especificação |
|---|---|
| Modelo | Orange Pi 4 Pro |
| Memória RAM | 4 GB |
| Armazenamento | SSD NVMe 128 GB |
| Rede | Ethernet Gigabit |

---

# 🏗️ Arquitetura

A infraestrutura será baseada em containers Docker.

Visão geral:

```
Internet

    │

Cloudflare

    │

Cloudflare Tunnel

    │

Orange Pi

    │

Ubuntu Server

    │

Docker

    │

    ├── Portainer
    │
    ├── MySQL
    │
    ├── Rico Trade System
    │
    ├── Nextcloud
    │
    ├── Uptime Kuma
    │
    └── Watchtower
```

---

# 🚀 Tecnologias

## Sistema Operacional

- Armbian Ubuntu 26.04 LTS Minimal (CLI) (https://armbian.com/boards/orangepi4-lts)


## Containerização

- Docker Engine
- Docker Compose


## Rede e Segurança

- Cloudflare Tunnel
- Firewall UFW
- SSH


## Aplicações

- Rico Trade System
- Nextcloud
- Portainer
- Uptime Kuma


## Banco de Dados

- MySQL

Schemas planejados:

```
MySQL

├── bd_tripolipy

└── bd_ricotradesys
```

---

# 📂 Estrutura do Projeto

```
HOMESERVER-ORANGEPI

│
├── docs/
│
├── compose/
│
├── scripts/
│
├── diagrams/
│
├── images/
│
└── README.md
```

---

# 📚 Documentação

A documentação completa está organizada em:

```
docs/
```

Documentos principais:

| Documento | Descrição |
|-|-|
| 00 - Visao Geral | Objetivos e arquitetura do projeto |
| 01 - Hardware | Especificações do servidor |
| 02 - Arquitetura | Detalhamento da infraestrutura |
| 03 - Rede | Configuração de acesso e conectividade |
| 04 - Docker | Containers e organização |
| 05 - Cloudflare | Tunnel e segurança |
| 06 - Banco de Dados | MySQL e backups |
| 07 - Rico Trade System | Implantação da aplicação |
| 08 - Nextcloud | Nuvem pessoal |
| 09 - Monitoramento | Observabilidade |
| 10 - Backup | Estratégia de recuperação |

---

# 🗺️ Roadmap

## Sprint 0 — Planejamento

Status: 🟡 Em andamento

- [x] Criar repositório Git
- [x] Criar estrutura inicial
- [x] Criar documentação base
- [ ] Definir arquitetura final
- [ ] Criar diagramas


## Sprint 1 — Sistema Operacional

- Instalação Ubuntu Server
- Configuração inicial
- SSH
- Usuários
- Firewall


## Sprint 2 — Docker

- Docker Engine
- Docker Compose
- Portainer


## Sprint 3 — Rede

- Cloudflare Tunnel
- Domínio
- HTTPS


## Sprint 4 — Aplicações

- MySQL
- Rico Trade System
- Nextcloud


## Sprint 5 — Operação

- Backups
- Monitoramento
- Atualizações
- Recuperação de desastre

---

# 📊 Status Atual

```
Projeto iniciado

████░░░░░░░░░░░░░░░░

20%
```

Fase atual:

> Planejamento e documentação da infraestrutura.

---

# 🎯 Objetivo Final

Construir uma infraestrutura doméstica profissional, segura e documentada, permitindo:

- administração simples;
- expansão futura;
- migração para outro hardware;
- recuperação rápida em caso de falha.

---

# Autor

Projeto pessoal desenvolvido como laboratório de infraestrutura, Docker e DevOps.
