FROM openjdk:11-jre-slim
EXPOSE 8888
ADD /target/my-app.jar demo.jar
ENTRYPOINT ["java","-jar","demo.jar"]
