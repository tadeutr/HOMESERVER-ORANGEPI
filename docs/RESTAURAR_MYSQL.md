# Restauração manual do MySQL 8.4

Este guia recupera o conteúdo de um backup gerado pelo `backup.sh`. Não há automação de restore: execute os passos com calma, diretamente no Orange Pi.

> **Atenção — operação com impacto:** a restauração pode substituir dados existentes nos bancos que fazem parte do backup. Pare as aplicações que gravam no MySQL antes de começar e confirme o arquivo escolhido. Se os dados atuais ainda tiverem valor, gere um backup manual antes do restore (quando isso for seguro).

## Cenário de recuperação

Use este procedimento em caso de exclusão acidental, tabela/banco corrompido ou necessidade de voltar ao estado de um backup anterior.

1. Acesse o servidor e vá para o repositório:

   
   cd ~/Projetos/HOMESERVER-ORANGEPI
   
2. Pare as aplicações que usam o banco, para que ninguém grave dados durante a recuperação.

3. Liste os backups, do mais recente para o mais antigo:

   
   sudo ls -lht /Docker/backups/mysql/mysql_*.sql.gz
   
   Escolha o arquivo pelo horário. Para usar o mais recente, guarde-o em uma variável:

   
   BACKUP="$(sudo ls -1t /Docker/backups/mysql/mysql_*.sql.gz | head -n 1)"
   echo "$BACKUP"
   
   Se for restaurar outro ponto no tempo, informe-o explicitamente:

   
   BACKUP="/Docker/backups/mysql/mysql_AAAA-MM-DD_HH-MM-SS.sql.gz"
   
4. Verifique se o arquivo está íntegro antes de alterar o banco:

   
   sudo gzip -t "$BACKUP"
   sudo zcat "$BACKUP" | head -n 20
   
   O primeiro comando não deve mostrar erro. O segundo deve exibir o início do dump SQL; pressione `Ctrl+C` depois de conferir.

5. Com as aplicações ainda paradas, restaure o dump:

   
   sudo zcat "$BACKUP" | sudo docker exec -i mysql sh -c 'MYSQL_PWD="$MYSQL_PASSWORD" mysql -uadmin'
   
   Aguarde o comando terminar sem mensagens de erro. Não use `-p` no comando `mysql` nesse pipeline: a senha é passada ao processo dentro do container pela variável `MYSQL_PWD`.

6. Valide os bancos restaurados. Abra o cliente MySQL:

   
   sudo docker exec -it mysql sh -c 'MYSQL_PWD="$MYSQL_PASSWORD" mysql -uadmin'
   
   No prompt `mysql>`, execute:

   ql
   SHOW DATABASES;

   USE bd_tripoli;
   SHOW TABLES;

   USE bd_ricotradesys;
   SHOW TABLES;
   
   Se os bancos esperados forem outros, substitua os nomes acima pelos schemas corretos. Para sair, use:

   ql
   EXIT;
   
7. Faça uma checagem funcional da aplicação e só então volte a iniciá-la.

## Como entrar no container, quando necessário

Para abrir um terminal Linux dentro do container MySQL:


sudo docker exec -it mysql sh

Lá dentro, para abrir o cliente MySQL:


MYSQL_PWD="$MYSQL_PASSWORD" mysql -uadmin

Para sair do MySQL use `EXIT;`; para sair do container use `exit`.

## Checklist final

- [ ] Aplicações que escrevem no MySQL foram paradas.
- [ ] O arquivo correto foi selecionado e passou em `gzip -t`.
- [ ] O comando de restore terminou sem erro.
- [ ] `SHOW DATABASES;` mostra os schemas esperados.
- [ ] As tabelas de cada schema foram conferidas com `SHOW TABLES;`.
- [ ] A aplicação foi testada antes de voltar ao funcionamento normal.
