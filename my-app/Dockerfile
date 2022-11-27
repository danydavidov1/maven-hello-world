FROM maven:3.5.0-jdk-8-alpine AS builder


ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package

FROM openjdk:8-jre-alpine

RUN useradd -ms /bin/bash daniel

USER daniel
WORKDIR /home/daniel
COPY --from=builder target/*.jar target/

CMD ["java", "-jar", "target/my-app-1.0.1.jar"]