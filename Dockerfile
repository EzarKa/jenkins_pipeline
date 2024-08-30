FROM jenkins/jenkins:lts
USER root

RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

RUN groupadd docker && usermod -aG docker jenkins
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
ENV DOCKER_HOST=unix:///var/run/docker.sock

USER root