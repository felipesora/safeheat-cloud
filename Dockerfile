# Etapa de build da aplicação usando Maven e JDK 21
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia todos os arquivos do projeto para dentro do container
COPY . .

# Executa o build do projeto
RUN mvn clean package -DskipTests

# Etapa de runtime com imagem mais leve com JDK 21
FROM eclipse-temurin:21-jdk

# Define novamente o diretório de trabalho
WORKDIR /app

# Cria um novo usuário não-root chamado 'safeuser' com UID 1001
RUN useradd -m -u 1001 safeuser

# Copia o JAR gerado na etapa anterior para este novo container
COPY --from=build /app/target/*.jar app.jar

# Altera a permissão dos arquivos para o usuário 'safeuser'
RUN chown -R safeuser:safeuser /app

# Define que o container será executado com o usuário não-root
USER safeuser

# Expõe a porta 8080
EXPOSE 8080

# Roda o JAR da aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]