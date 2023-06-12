FROM adoptopenjdk/openjdk11:alpine-jre
EXPOSE 8081
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} b-service-1.1.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/b-service-1.1.1-SNAPSHOT.jar"]
