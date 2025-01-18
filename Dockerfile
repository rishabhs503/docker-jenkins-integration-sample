# Use the official Jenkins image as the base
FROM jenkins/jenkins:lts

# Switch to root user to install packages
USER root

# Install Maven and necessary dependencies
RUN apt-get update && apt-get install -y \
    maven \
    && rm -rf /var/lib/apt/lists/*

# Switch back to Jenkins user
USER jenkins

FROM openjdk:8
EXPOSE 8080
ADD target/docker-jenkins-integration-sample.jar docker-jenkins-integration-sample.jar
ENTRYPOINT ["java","-jar","/docker-jenkins-integration-sample.jar"]
