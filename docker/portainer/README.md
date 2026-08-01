# Portainer

## Objetivo

Interface web para gerenciamento dos containers Docker.

## Iniciar

```bash
docker compose up -d
```

## Parar

```bash
docker compose down
```

## Acesso

https://localhost:9443

Na primeira execução será solicitado o cadastro do usuário administrador.

## Observações

Na primeira inicialização, o Portainer gera um Setup Token.

O token pode ser obtido com:

docker logs --tail 30 portainer

Por questões de segurança, o token expira após alguns minutos.

Caso isso ocorra, reinicie o serviço:

docker compose down
docker compose up -d

e utilize o novo token.