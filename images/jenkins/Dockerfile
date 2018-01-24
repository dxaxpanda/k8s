from jenkins/jenkins:lts-alpine


# setup various installation required by root
USER root



# fallback to jenkins user as good practice
USER jenkins
# Add plugin list and install them
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt 
# remove the upgrade banner
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state


