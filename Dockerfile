FROM openjdk:17
EXPOSE 8080
COPY target/devops-integration-demo.jar devops-integration-demo.jar
ENTRYPOINT ["java", "-jar", "/devops-integration-demo.jar"]