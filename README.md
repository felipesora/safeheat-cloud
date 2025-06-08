# 🔥 SafeHeat - Cloud

[![GitHub Repo](https://img.shields.io/badge/GitHub-Repository-blue)](https://github.com/felipesora/safeheat-cloud)

O **SafeHeat - Cloud** é um projeto que demonstra a utilização de **containers Docker** para orquestrar uma aplicação completa com **Java (Spring Boot)** e **PostgreSQL**. A ideia é executar dois containers simultaneamente: um para o banco de dados e outro para a API backend, conectados através de uma rede Docker.

---

## 👥 Integrantes

- **Felipe Ulson Sora** – RM555462 – [@felipesora](https://github.com/felipesora)
- **Augusto Lopes Lyra** – RM558209 – [@lopeslyra10](https://github.com/lopeslyra10)
- **Vinicius Ribeiro Nery Costa** – RM559165 – [@ViniciusRibeiroNery](https://github.com/ViniciusRibeiroNery)

---

## 🚀 Tecnologias Utilizadas

- Java 21 + Spring Boot
- PostgreSQL 16
- Docker
- Maven

---

## 🧱 Estrutura com Docker

O projeto utiliza uma rede Docker personalizada chamada `safeheat-network` para conectar os containers da aplicação. Abaixo está o passo a passo para executar tudo corretamente:

---

## ⚙️ Passo a passo para rodar o projeto com Docker

```bash
# 1. Build da imagem da API
docker build -t safeheat-api .

# 2. Criação da rede Docker
docker network create safeheat-network

# 3. Subir o container do banco PostgreSQL
docker run -d --name postgres-db --network safeheat-network \
  -e POSTGRES_DB=safeheatdb \
  -e POSTGRES_USER=admin \
  -e POSTGRES_PASSWORD=admin123 \
  -v postgres_data:/var/lib/postgresql/data \
  -p 5432:5432 \
  postgres:16

# 4. Verificar os logs do banco
docker logs postgres-db

# 5. Subir o container da API Java
docker run -d --name safeheat-api --network safeheat-network \
  -e SPRING_DATASOURCE_URL=jdbc:postgresql://postgres-db:5432/safeheatdb \
  -e SPRING_DATASOURCE_USERNAME=admin \
  -e SPRING_DATASOURCE_PASSWORD=admin123 \
  -p 8080:8080 \
  safeheat-api

# 6. Verificar os logs da API
docker logs safeheat-api
```

## 📬 Exemplos de uso da API (corpo das requisições JSON)

### 👤 Cadastro de Usuário

```jsonc
{
    "nome": "Felipe Sora",
    "email": "felipesora@email.com",
    "senha": "felipe123"
}
```

### 📍 Cadastro de Local

```jsonc
{
    "nome": "Casa",
    "rua": "Avenida Vila Ema",
    "numero": "1005",
    "complemento": "apto 136",
    "bairro": "Vila Prudente",
    "cidade": "São Paulo",
    "estado": "SP",
    "cep": "03156000",
    "id_usuario": ""
}
```

### 🌡️ Envio de Alerta de Calor

```jsonc
{
  "temperatura": "45",
  "mensagem": "Risco alto de insolação, evite exposição prolongada ao sol",
  "nivel_risco": "Alta",
  "id_local": ""
}
```

## 🎥 Demonstração em vídeo

Assista ao passo a passo completo no YouTube pelo link abaixo:

[📺 Clique aqui para assistir ao vídeo](https://www.youtube.com/watch?v=ATThgLka8XI)

--- 

## 📂 Repositório da API Java

O código-fonte da API desenvolvida em Java (Spring Boot) está disponível no GitHub:

🔗 [Acessar repositório da API Java](https://github.com/felipesora/safeheat-backend-java)