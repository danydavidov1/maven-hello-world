FROM maven:3.5.0-jdk-8-alpine AS builder


ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package

FROM openjdk:8-jre-alpine

RUN useradd -u 8877 john
# Change to non-root privilege
USER john
COPY --from=builder target/*.jar target/

CMD ["java", "-jar", "target/my-app-1.0.1.jar"]