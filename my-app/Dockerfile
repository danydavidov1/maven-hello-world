FROM maven:3.5.0-jdk-8-alpine AS builder

# ADD ./change_version.sh change_version.sh
# RUN chmod +x ./change_version.sh
ADD ./pom.xml pom.xml
ADD ./src src/
# RUN ./change_version.sh
RUN mvn clean package

FROM openjdk:8-jre-alpine

COPY --from=builder target/*.jar target/

CMD ["java", "-jar", "target/my-app-1.0.1.jar"]