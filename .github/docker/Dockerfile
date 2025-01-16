FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y docker.io

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY config.xml /var/jenkins_home/config.xml

EXPOSE 8080
EXPOSE 50000

CMD ["bash", "-c", "service docker start && /usr/local/bin/jenkins.sh"]
