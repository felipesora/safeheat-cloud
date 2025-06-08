# 🌡️ SafeHeat - Backend Java

API desenvolvida em **Java 21 com Spring Boot** para o projeto **SafeHeat**, parte da entrega do Global Solution da FIAP. A aplicação fornece um CRUD completo e se conecta a um banco de dados **Oracle**, com tudo rodando em containers **Docker**.

---

## 🚀 Tecnologias Utilizadas

- Java 21  
- Spring Boot  
- Maven  
- Oracle Database  
- Docker  

---

## 📁 Estrutura do Projeto

```
Cloud GS/
│
├── safeheat-backend-java-main/
│   └── target/
│       └── safeheat-backend-java-0.0.1-SNAPSHOT.jar
│
└── Dockerfile
```

---

## ⚙️ Pré-requisitos

Antes de rodar a aplicação, você precisa ter instalado:

- [Docker](https://www.docker.com/)
- [Java 21](https://jdk.java.net/21/) *(opcional, caso deseje compilar localmente)*
- [Maven](https://maven.apache.org/) *(para gerar o .jar)*

---

## 🛠️ Como compilar o projeto

Se ainda não gerou o `.jar`, execute o seguinte comando a partir da pasta do projeto:

```bash
cd safeheat-backend-java-main
mvn clean package
```

Isso irá gerar o arquivo `safeheat-backend-java-0.0.1-SNAPSHOT.jar` na pasta `target/`.

---

## 🐳 Como rodar com Docker

1. Certifique-se de estar na raiz do projeto (`Cloud GS`) e que o `Dockerfile` esteja presente.
2. Para construir a imagem Docker da aplicação:

```bash
docker build -t safeheat-api .
```

3. Em seguida, rode o container:

```bash
docker run -d -p 8080:8080 --name safeheat-container safeheat-api
```

---

## 🌐 Acessando a API

A API estará acessível em:

```
http://localhost:8080
```

### Exemplos de endpoints (ajuste conforme sua implementação):

- `GET /api/usuarios`
- `POST /api/usuarios`
- `PUT /api/usuarios/{id}`
- `DELETE /api/usuarios/{id}`

---

## 🧼 Comandos úteis

Parar o container:

```bash
docker stop safeheat-container
```

Remover o container:

```bash
docker rm safeheat-container
```

Visualizar os logs do container:

```bash
docker logs safeheat-container
```

---

## 📌 Observações

- Certifique-se de que o banco Oracle esteja rodando e acessível (pode ser em outro container).
- O backend pode depender de variáveis de ambiente para se conectar ao banco — ajuste no Dockerfile ou na execução se necessário.
- O container roda como um usuário não-root para mais segurança.

---

## 👥 Integrantes

- **Felipe Ulson Sora** – RM555462 – [@felipesora](https://github.com/felipesora)  
- **Augusto Lope Lyra** – RM558209 – [@lopeslyra10](https://github.com/lopeslyra10)  
- **Vinicius Ribeiro Nery Costa** – RM559165 – [@ViniciusRibeiroNery](https://github.com/ViniciusRibeiroNery)

**FIAP – Global Solution 2025**
