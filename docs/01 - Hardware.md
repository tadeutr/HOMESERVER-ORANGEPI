# Hardware

Documentação do hardware utilizado no projeto Home Server Orange Pi.

---

# Equipamento Principal

## Orange Pi 4 Pro

O servidor principal do projeto será baseado em um Orange Pi 4 Pro.

A escolha deste equipamento considera o equilíbrio entre:

- baixo consumo de energia;
- tamanho compacto;
- operação contínua;
- suporte a armazenamento rápido via NVMe;
- capacidade suficiente para serviços domésticos e aplicações próprias.

---

# Especificações

| Componente | Especificação |
|---|---|
| Modelo | Orange Pi 4 Pro |
| Memória RAM | 4 GB |
| Armazenamento principal | SSD NVMe 128 GB |
| Arquitetura | ARM |
| Rede | Ethernet Gigabit |
| Uso previsto | Home Server |

---

# Objetivo do Hardware

O equipamento deverá operar como um servidor doméstico 24 horas por dia, hospedando serviços através de containers Docker.

Principais responsabilidades:

- executar aplicações web;
- hospedar bancos de dados;
- armazenar arquivos pessoais;
- executar serviços auxiliares;
- realizar backups automáticos;
- monitorar a própria infraestrutura.

---

# Armazenamento

O armazenamento principal será realizado através de SSD NVMe.

A utilização de NVMe foi escolhida devido a:

- maior velocidade em relação a cartões SD;
- maior confiabilidade;
- melhor desempenho para bancos de dados;
- melhor desempenho para aplicações web;
- menor risco de corrupção de sistema.

---

# Estratégia Inicial de Disco

O SSD de 128 GB será organizado inicialmente utilizando uma única partição principal.

A organização lógica será realizada através de diretórios:

```
/srv

├── docker
├── mysql
├── nextcloud
├── backups
└── logs
```

A separação será feita por estrutura de diretórios e volumes Docker.

---

# Estimativa de Uso do Espaço

Distribuição inicial planejada:

| Área | Uso estimado |
|---|---:|
| Sistema operacional | 20 GB |
| Docker e containers | 15 GB |
| Banco MySQL | 10 GB |
| Nextcloud | 40-50 GB |
| Backups locais | restante disponível |

Essa distribuição poderá ser ajustada conforme a utilização real.

---

# Expansão Futura

Caso a demanda aumente, estão previstas possibilidades:

- troca por SSD NVMe de maior capacidade;
- utilização de armazenamento externo;
- migração para Mini PC;
- utilização de NAS dedicado;
- armazenamento externo para backups.

---

# Considerações Técnicas

## Arquitetura ARM

O Orange Pi utiliza arquitetura ARM.

Antes da implantação definitiva serão validados:

- compatibilidade das imagens Docker;
- suporte dos containers utilizados;
- desempenho dos serviços.

---

## Disponibilidade

O servidor será projetado para funcionar continuamente.

Porém, como se trata de um ambiente doméstico, devem ser considerados:

- interrupções de energia;
- falhas de internet;
- desgaste do SSD;
- necessidade de backups externos.

---

# Pontos de Atenção

Antes da instalação definitiva serão avaliados:

- suporte oficial ao Ubuntu Server;
- funcionamento correto do SSD NVMe;
- temperatura em operação contínua;
- consumo energético;
- estabilidade dos drivers.

---

## Sistema Operacional

A escolha do sistema operacional considera a arquitetura ARM específica do Orange Pi.

Será utilizado Armbian com Ubuntu LTS, devido ao suporte otimizado para SBCs.

# Conclusão

O Orange Pi 4 Pro atende aos objetivos iniciais do projeto, oferecendo uma plataforma compacta e eficiente para construção de um Home Server baseado em Docker.

A arquitetura será planejada considerando futuras expansões, evitando dependência excessiva do hardware atual.