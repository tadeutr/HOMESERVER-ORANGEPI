## TERMINAL SSH VIA WEB

# Porque a escolha do TTYD: 
 - A imagem Alpine ARM64 oficializada no Docker Hub tem apenas ~5,6 MB comprimida na versão 1.7.8-alpine

# Camada de Segurança:
- SSH por chave (Nada de deixar uma senha SSH administrativa exposta)
- Cloudflare
   ↓
  ttyd
   ↓
  SSH
   ↓
  orangepi
   ↓
  sudo quando necessário 
- Assim continuamos utilizando o SSH real do Linux.
- Isso significa que o ttyd não precisa ter privilégios especiais no host.
- Ele simplesmente funciona como uma "ponte visual" entre o navegador e uma sessão SSH.

# Vantagem importante
- Ele não precisa transformar o container em um "servidor de administração".
- O container pode ser apenas:

  Browser
   ↓
  ttyd
   ↓
  SSH
   ↓
  OrangePi

- O sistema operacional continua sendo administrado pelo SSH normal.
- Isso é excelente do ponto de vista de segurança e arquitetura.