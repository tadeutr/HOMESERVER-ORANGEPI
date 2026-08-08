# Comandos Úteis - Home Server Orange Pi


# Ver informações do sistema
uname -a

# Ver uso de disco
df -h

# Ver memória
free -h

# Ver temperatura
orangepimonitor

# LINUX

# Ver status de um serviço
sudo systemctl status nome_servico

# Reiniciar serviço
sudo systemctl restart nome_servico

# Ver logs
journalctl -u nome_servico -n 100


# DOCKER

## Ver versão do Docker

docker --version

## Ver versão do Docker Compose

docker compose version

## Ver status do Docker

sudo systemctl status docker

## Iniciar Docker

sudo systemctl start docker

## Reiniciar Docker

sudo systemctl restart docker

## Parar Docker

sudo systemctl stop docker

## Habilitar Docker no boot

sudo systemctl enable docker

---

# CONTAINERS

## Listar containers em execução

docker ps

## Listar todos os containers (inclusive parados)

docker ps -a

## Iniciar container parado

docker start NOME_CONTAINER

Exemplo:

docker start mysql

## Parar container

docker stop NOME_CONTAINER

## Reiniciar container

docker restart NOME_CONTAINER

## Remover container

docker rm NOME_CONTAINER

## Remover todos containers parados

docker container prune

---

# LOGS DOCKER

## Ver logs de um container

docker logs NOME_CONTAINER

## Acompanhar logs em tempo real

docker logs -f NOME_CONTAINER

## Últimas 100 linhas do log

docker logs --tail 100 NOME_CONTAINER

---

# DIAGNÓSTICO DOCKER

## Ver consumo dos containers

docker stats

## Informações gerais do Docker

docker info

## Listar imagens instaladas

docker images

## Remover imagens sem uso

docker image prune

## Limpeza geral Docker

docker system prune

Remove:
- containers parados
- redes não utilizadas
- imagens sem uso

## Limpeza completa Docker

docker system prune -a

⚠️ Remove imagens não utilizadas.

---

# DOCKER COMPOSE

## Entrar na pasta da Stack

cd /Docker/stacks/NOME_STACK

## Subir uma Stack

docker compose up -d

## Derrubar uma Stack

docker compose down

## Reiniciar uma Stack

docker compose restart

## Ver status da Stack

docker compose ps

## Ver logs da Stack

docker compose logs

## Acompanhar logs em tempo real

docker compose logs -f

## Atualizar imagens da Stack

docker compose pull

Depois:

docker compose up -d

---

# REDES DOCKER

## Listar redes

docker network ls

## Criar rede

docker network create NOME_REDE

## Ver detalhes da rede

docker network inspect NOME_REDE

---

# VOLUMES DOCKER

## Listar volumes

docker volume ls

## Ver detalhes do volume

docker volume inspect NOME_VOLUME

---

# MYSQL

## Verificar container MySQL

docker ps | grep mysql

## Ver logs do MySQL

docker logs mysql

## Acompanhar logs MySQL

docker logs -f mysql

## Reiniciar MySQL

docker restart mysql

---

# ACESSO MYSQL

## Entrar no MySQL dentro do container

docker exec -it mysql mysql -u root -p

---

## Comandos dentro do MySQL

### Listar bancos

ql
SHOW DATABASES;

### Selecionar banco

ql
USE nome_database;

### Listar tabelas

ql
SHOW TABLES;

### Ver estrutura da tabela

ql
DESCRIBE nome_tabela;

### Sair do MySQL

ql
exit;

---

# BACKUP MYSQL

## Exportar banco

docker exec mysql mysqldump -u root -p nome_database > backup.sql

## Restaurar banco

cat backup.sql | docker exec -i mysql mysql -u root -p nome_database

---

# ADMINISTRAÇÃO MYSQL

## Ver usuários

ql
SELECT user,host FROM mysql.user;

## Ver bancos e tamanho

ql
SELECT 
table_schema AS Banco,
ROUND(SUM(data_length+index_length)/1024/1024,2) AS MB
FROM information_schema.tables
GROUP BY table_schema;

## Ver conexões ativas

ql
SHOW PROCESSLIST;

## Ver versão MySQL

ql
SELECT VERSION();

---

# CRISES RÁPIDAS

## Container parou

1. Ver containers:

docker ps -a

2. Ver logs:

docker logs NOME_CONTAINER

3. Reiniciar:

docker restart NOME_CONTAINER

---

## Banco MySQL caiu

1. Verificar:

docker ps -a | grep mysql

2. Ver logs:

docker logs mysql

3. Reiniciar:

docker restart mysql

4. Testar acesso:

docker exec -it mysql mysql -u root -p

---

# MANUTENÇÃO

## Ver espaço em disco

df -h

## Ver uso de memória

free -h

## Ver processos

top

## Ver temperatura Orange Pi

orangepimonitor
