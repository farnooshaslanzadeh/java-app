FROM maven:3.6.3-jdk-8-slim as builder
COPY pom.xml .
COPY . .
RUN mvn -f ./pom.xml clean package 

FROM openjdk:8
COPY --from=builder ./target/spring-boot-docker-0.0.1-SNAPSHOT.jar .

EXPOSE 8080
ENTRYPOINT ["java","-jar","./spring-boot-docker-0.0.1-SNAPSHOT.jar"]
