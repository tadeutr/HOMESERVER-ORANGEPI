Este documento responderá:

O que é este servidor?

Quando alguém abrir a documentação pela primeira vez, este será o primeiro arquivo que lerá.

Ele explicará:

objetivo do Home Server;
filosofia do projeto;
serviços previstos;
benefícios da arquitetura;
escopo do projeto.

## ---------------------------------------------------------------------------------

# Home Server Orange Pi

## Objetivo

Este projeto tem como objetivo documentar a implantação, configuração e manutenção de um Home Server baseado em um Orange Pi 4 Pro, utilizando Ubuntu Server, Docker e serviços auto-hospedados.

A proposta é construir uma infraestrutura organizada, segura, escalável e totalmente documentada, permitindo que qualquer reinstalação, migração ou expansão possa ser realizada de forma simples e previsível.

Mais do que um servidor funcional, este projeto busca servir como um laboratório de aprendizado em infraestrutura, Docker, redes, DevOps e administração de servidores Linux.

---

# Hardware

Equipamento principal

- Orange Pi 4 Pro
- 4 GB RAM
- SSD NVMe 128 GB
- Conexão Ethernet Gigabit

---

# Sistema Operacional

- Ubuntu Server 24.04 LTS

---

# Objetivos da Infraestrutura

A infraestrutura deverá atender aos seguintes requisitos:

- hospedar aplicações web próprias;
- centralizar bancos de dados MySQL;
- disponibilizar armazenamento em nuvem privado;
- permitir acesso remoto seguro;
- facilitar backups;
- facilitar restauração;
- facilitar futuras expansões.

---

# Serviços previstos

Inicialmente estão previstos os seguintes serviços:

- Docker Engine
- Docker Compose
- Portainer
- Cloudflare Tunnel
- MySQL
- Rico Trade System
- Nextcloud
- Uptime Kuma
- Watchtower

Novos serviços poderão ser adicionados futuramente sem necessidade de reconstrução da infraestrutura.

---

# Filosofia do Projeto

Este projeto seguirá alguns princípios básicos.

## Infraestrutura como Código

Sempre que possível, toda configuração deverá estar documentada ou armazenada em arquivos versionados.

Evita configurações manuais difíceis de reproduzir.

---

## Containers

Os serviços serão executados em containers Docker.

Nenhum serviço será instalado diretamente no sistema operacional, salvo quando estritamente necessário.

---

## Separação entre Sistema e Dados

Containers podem ser recriados.

Os dados devem permanecer preservados através de volumes Docker.

---

## Segurança

Sempre que possível serão utilizadas:

- autenticação por chave SSH;
- firewall UFW;
- acesso remoto via Cloudflare Tunnel;
- mínimo de portas expostas.

---

## Organização

Cada serviço possuirá seu próprio diretório contendo:

- docker-compose.yml
- arquivo .env
- volumes
- documentação específica

---

# Estrutura prevista

/srv

docker/

backups/

logs/

---

# Roadmap

Fase 00 — Planejamento

Fase 01 — Ubuntu Server

Fase 02 — Configuração Inicial

Fase 03 — Docker

Fase 04 — Portainer

Fase 05 — Cloudflare Tunnel

Fase 06 — Banco MySQL

Fase 07 — Rico Trade System

Fase 08 — Nextcloud

Fase 09 — Monitoramento

Fase 10 — Backup e Recuperação

---

# Objetivo Final

Ao término deste projeto, espera-se possuir um Home Server totalmente funcional, seguro, documentado e preparado para futuras expansões, podendo ser migrado para outro hardware com o mínimo de esforço.