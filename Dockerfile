FROM eclipse-temurin:17-jdk-alpine
ADD target/client-api-docker-1.2.1.jar client-api.jar
EXPOSE 9902
ENTRYPOINT ["java", "-jar", "client-api.jar"]