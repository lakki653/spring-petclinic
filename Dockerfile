FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY src ./src
RUN mvn clean package-Dskip Tests


FROM openjdk:25-ea-21-jdk
WORKDIR /app
COPY --from=build/app/target/*.jar app.jar
CMD java-jar app.jar
EXPOSE 8080
