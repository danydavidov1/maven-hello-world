FROM maven:3.5.0-jdk-8-alpine AS builder


ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package

FROM openjdk:8-slim-bullseye

ARG UID=1000
ARG GID=1000
ARG version
ENV envValue=$version

COPY --from=builder target/*.jar target/

RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential curl libpq-dev \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
  && apt-get clean \
  && groupadd -g "${GID}" java \
  && useradd --create-home --no-log-init -u "${UID}" -g "${GID}" java \
  && chown java:java -R /target

  USER java

RUN echo ${version}
CMD ["sh", "-c", "java -jar target/my-app-"${envValue}".jar"]


# CMD java -jar target/my-app-"${envValue}".jar