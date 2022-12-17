FROM openjdk:11-jre-slim
EXPOSE 8888
ADD target/my-app-1.0-SNAPSHOT.jar my-app.jar
ENTRYPOINT ["java","-jar","my-app.jar"]
