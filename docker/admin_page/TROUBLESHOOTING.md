## CloudBeaver retorna 502

### Sintoma

https://db.trisystem.com.br retorna Bad Gateway.

### Verificação

docker ps
curl -I http://127.0.0.1:8978

### Solução

Verificar se o container está expondo:

127.0.0.1:8978->8978/tcp

Se necessário:

docker compose down
docker compose up -d