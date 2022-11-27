FROM maven:3.5.0-jdk-8-alpine AS builder


ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package

FROM openjdk:8-jre-alpine

ARG USERNAME=daniel
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

USER daniel
WORKDIR /home/$USERNAME
COPY --from=builder target/*.jar target/

CMD ["java", "-jar", "target/my-app-1.0.1.jar"]