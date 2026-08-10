# MySQL 8.4 LTS

MySQL utilizado pelo Home Server Orange Pi.

Usuário: Admin
Senha: Nome+adesempre   ---> Não tem o arr

## Arquitetura

O MySQL utiliza a rede Docker externa `homeserver`.

Não existe publicação da porta 3306 no host.

Os dados persistentes ficam em:

`/Docker/volumes/mysql`

Os backups ficam em:

`/Docker/backups/mysql`

## Schemas

- `bd_tripoli`
- `bd_ricotradesys`

## Subir

```bash
docker compose up -d