# Home Server Orange Pi 4 Pro
## Guia Rápido de Instalação (INSTALL.md)

> **Objetivo**
>
> Este documento descreve, de forma resumida, todo o processo de implantação do Home Server baseado em um Orange Pi 4 Pro.
>
> O objetivo é permitir reconstruir completamente o servidor em caso de troca de SSD, falha de hardware ou reinstalação do sistema operacional.
>
> Os detalhes técnicos de cada etapa serão documentados futuramente na pasta `/docs`.

---

# Informações do Projeto

| Item | Valor |
|------|-------|
| Hardware | Orange Pi 4 Pro |
| Processador | Allwinner A733 |
| Memória | 4 GB LPDDR5 |
| Armazenamento | SSD NVMe 128 GB |
| Sistema Operacional | Ubuntu Server Jammy |
| Virtualização | Docker + Docker Compose |
| Gerenciamento | Portainer |
| Proxy | Nginx Proxy Manager |
| Banco de Dados | MySQL |
| Monitoramento | Uptime Kuma |
| Atualizações | Watchtower |
| Acesso Remoto | Cloudflare Tunnel + Tailscale |

---

# Fluxo Geral da Instalação

```
Preparação
      │
      ▼
Ubuntu Server
      │
      ▼
Configuração Inicial
      │
      ▼
Docker
      │
      ▼
Portainer
      │
      ▼
Infraestrutura Base
      │
      ▼
Aplicações
      │
      ▼
Backup
      │
      ▼
Monitoramento
```

---

# Checklist Geral

## 1. Hardware

- [x] Orange Pi 4 Pro
- [x] SSD NVMe
- [x] Fonte USB-C 5V / 3A
- [x] microSD
- [x] Cabo de Rede

---

## 2. Sistema Operacional

- [x] Download da imagem Ubuntu Server oficial
- [x] Extração do arquivo .7z
- [ ] Verificação do SHA256
- [ ] Gravação da imagem no microSD BELANA
- [ ] Primeiro Boot
- [ ] Configuração do Boot pelo NVMe
- [ ] Remoção do microSD

---

## 3. Configuração Inicial

- [ ] Atualizar Ubuntu

- [ ] Configurar:

    - Hostname

    - Timezone

    - Locale

    - Usuário

    - SSH

    - Firewall

---

## 4. Estrutura do Servidor

Criar estrutura padrão.

```
/Docker

    /compose

    /volumes

    /backups

    /scripts

    /logs

    /mysql

    /portainer

    /npm

    /nextcloud

    /uptime-kuma

    /watchtower
```

---

## 5. Docker

- [ ] Instalar Docker Engine

- [ ] Instalar Docker Compose

- [ ] Adicionar usuário ao grupo docker

- [ ] Validar instalação

---

## 6. Portainer

- [ ] Criar Container

- [ ] Configurar acesso

- [ ] Validar gerenciamento

---

## 7. Banco de Dados

- [ ] MySQL

- [ ] Volume Persistente

- [ ] Usuários

- [ ] Backup

---

## 8. Proxy Reverso

- [ ] Nginx Proxy Manager

- [ ] SSL

- [ ] Proxy Hosts

---

## 9. Cloudflare

- [ ] Tunnel

- [ ] DNS

- [ ] Publicação dos serviços

---

## 10. Monitoramento

- [ ] Uptime Kuma

- [ ] Watchtower

---

## 11. Nextcloud

- [ ] Instalação

- [ ] Configuração

- [ ] Backup

---

## 12. Tailscale

- [ ] Instalação

- [ ] Login

- [ ] Testes

---

## 13. Aplicações

### TradePy

- [ ] Deploy

- [ ] Banco

- [ ] Backup

---

### APIs do TripoliPy

- [ ] Deploy

- [ ] Testes

---

## 14. Backup

- [ ] Banco MySQL

- [ ] Volumes Docker

- [ ] Arquivos Compose

- [ ] Scripts

---

## 15. Atualizações

- [ ] Ubuntu

- [ ] Docker

- [ ] Containers

---

## 16. Disaster Recovery

Objetivo:

Reconstruir completamente o servidor em menos de 2 horas.

Procedimento resumido:

1. Instalar Ubuntu.
2. Configurar boot pelo NVMe.
3. Instalar Docker.
4. Restaurar repositório Git.
5. Restaurar backups.
6. Subir containers.
7. Validar serviços.

---

# Status da Implantação

| Etapa | Status |
|--------|--------|
| Hardware | 🟡 Em andamento |
| Ubuntu | ⏳ Preparação |
| Docker | ⬜ |
| Portainer | ⬜ |
| MySQL | ⬜ |
| Nginx Proxy Manager | ⬜ |
| Cloudflare Tunnel | ⬜ |
| Nextcloud | ⬜ |
| Tailscale | ⬜ |
| TradePy | ⬜ |

---

# Observações

- O servidor será administrado preferencialmente via SSH.
- Todos os serviços serão executados em containers Docker.
- A configuração será mantida sob controle de versão (Git).
- Sempre que possível, utilizar volumes persistentes para dados.
- Toda alteração significativa deverá ser refletida na documentação.

---

# Próximos Documentos

```
docs/

01-Arquitetura.md

02-Hardware.md

03-Ubuntu.md

04-Docker.md

05-Portainer.md

06-MySQL.md

07-Nginx-Proxy-Manager.md

08-Cloudflare.md

09-Uptime-Kuma.md

10-Watchtower.md

11-Nextcloud.md

12-Tailscale.md

13-Backup.md

14-Disaster-Recovery.md
```

---

**Versão:** 1.0  
**Projeto:** Home Server Orange Pi 4 Pro  
**Última atualização:** Em implantação