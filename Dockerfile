#Stage 1: Build the JAR file 
#FROM maven:3.8.5-openjdk-17 AS build
#WORKDIR /app
#COPY pom.xml .
#RUN mvn dependency:go-offline
#COPY src ./src
#RUN mvn package -DskipTests

# Stage 2: Create the final image
#FROM openjdk:17-jdk-slim
#WORKDIR /app
#COPY --from=build /app/target/client-api-docker-1.2.1.jar ./client-api-docker.jar
#EXPOSE 9902
#RUN pwd
#ENTRYPOINT ["java", "-jar", "client-api-docker.jar"]









#Old Dockerfile
FROM eclipse-temurin:17-jre-alpine
ADD target/client-api-docker-1.2.1.jar client-api.jar
EXPOSE 9902
ENTRYPOINT ["java", "-jar", "client-api.jar"]