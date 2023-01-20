FROM jenkins/jenkins:jdk11

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# RUN java -jar /var/jenkins_home/war/WEB-INF/lib/cli-2.375.2.jar -s http://localhost:8080/ login --username admin --password admin 

COPY Jenkinsfile /var/jenkins_home/
# COPY jobs /var/jenkins_home/jobs/
# COPY jenkins-cli.jar /var/jenkins_home/
# COPY setup_job.sh /usr/local/bin/

USER jenkins

# CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh", "--httpListenAddress=0.0.0.0", "--httpPort=8080"]

# RUN echo "Jenkins.instance.createProjectFromXML(\"triggerpythonjob\", new File(\"/var/jenkins_home/jobs/triggerpythonjob/config.xml\").text)" | java -jar /var/jenkins_home/jenkins-cli.jar -s http://localhost:8080/ groovy =

# RUN if ! java -jar /var/jenkins_home/war/WEB-INF/lib/cli-2.375.2.jar -s http://localhost:8080/ get-job triggerpythonjob ; then java -jar /var/jenkins_home/war/WEB-INF/lib/cli-2.375.2.jar -s http://localhost:8080/ create-job triggerpythonjob < /var/jenkins_home/jobs/triggerpythonjob/config.xml && echo "Job created"; fi

# RUN java -jar /var/jenkins_home/jenkins-cli.jar -s http://3.123.189.81:8080/ -auth admin:admin create-job triggerpythonjob < /var/jenkins_home/jobs/triggerpythonjob/config.xml
# USER root
# RUN chmod +x /usr/local/bin/setup_job.sh
# USER jenkins
# RUN ./usr/local/bin/setup_job.sh

# CMD ["sh", "/usr/local/bin/setup_job.sh"]
# CMD ["java", "-jar","/var/jenkins_home/jenkins-cli.jar", "-s", "http://3.123.189.81:8080/", "-auth", "admin:admin", "create-job", "triggerpythonjob", "<", "/var/jenkins_home/jobs/triggerpythonjob/config.xml"]