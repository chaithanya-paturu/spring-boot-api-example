FROM maven:3.8.4-openjdk-8 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8-alpine
COPY --from=build /home/app/target/HelloWorld-0.0.1-SNAPSHOT.jar /usr/local/lib/HelloWorld-0.0.1-SNAPSHOT.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/local/lib/HelloWorld-0.0.1-SNAPSHOT.jar"]
