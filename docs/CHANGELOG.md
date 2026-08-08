# Changelog

Histórico de evolução do projeto Home Server Orange Pi.

Este documento registra os principais marcos, decisões e alterações relevantes realizadas durante o desenvolvimento da infraestrutura.

---

# 2026-07-28

## Projeto iniciado

- Criado o projeto Home Server Orange Pi.
- Repositório Git inicializado.
- Estrutura inicial de diretórios criada.
- Definida a arquitetura baseada em Ubuntu Server, Docker e serviços containerizados.
- Criada documentação inicial do projeto.

## Decisões iniciais

Definidas as seguintes diretrizes:

- utilização de Docker como plataforma principal de serviços;
- utilização de Docker Compose para gerenciamento dos containers;
- organização dos dados separados dos containers;
- acesso externo utilizando Cloudflare Tunnel;
- manutenção de documentação técnica junto ao código.

## Estrutura inicial criada

Diretórios:

```
docs/
compose/
scripts/
diagrams/
images/
```

