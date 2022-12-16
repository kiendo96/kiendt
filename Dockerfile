FROM java:8
EXPOSE 8888
ADD /target/my-app.jar demo.jar
ENTRYPOINT ["java","-jar","demo.jar"]