# Dockerfile (Repo Root)
FROM maven:3.9.8-eclipse-temurin-17 AS builder
WORKDIR /app

# Cache maven dependencies first
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn clean package -DskipTests

# Final small runtime image
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar hmrs-app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "hmrs-app.jar"]