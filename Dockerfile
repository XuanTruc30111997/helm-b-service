# For Window
# FROM adoptopenjdk/openjdk11:alpine-jre
# For Mac Arm
FROM adoptopenjdk:11-jre-hotspot
EXPOSE 8081
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} b-service-1.5.2-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/b-service-1.5.2-SNAPSHOT.jar"]
