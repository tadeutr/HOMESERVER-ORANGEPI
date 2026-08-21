🚨 PROCEDIMENTO DE RECUPERAÇÃO
──────────────────────────────

1. Verificar servidor

   uptime
   df -h
   free -h

2. Verificar Docker

   docker ps
   docker ps -a

3. Verificar Cloudflare

   systemctl status cloudflared
   journalctl -u cloudflared -n 50

4. Verificar MySQL

   docker ps
   docker logs mysql

5. Verificar aplicações

   curl -I http://127.0.0.1:8501
   curl -I http://127.0.0.1:8978

6. Se necessário

   docker compose down
   docker compose up -d

7. #### NÃO FAZER

   docker system prune -a
   sem verificar os volumes