FROM openjdk:11-jre
COPY target/humanstory-0.0.1-SNAPSHOT.war app.war
ENTRYPOINT ["java","-jar","app.war"]
