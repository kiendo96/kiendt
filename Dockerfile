FROM openjdk:11-jre-slim
EXPOSE 8888
ADD /var/lib/jenkins/workspace/test/target/my-app-1.0-SNAPSHOT.jar demo.jar
ENTRYPOINT ["java","-jar","demo.jar"]
