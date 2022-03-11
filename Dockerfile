# Start with a base image containing Java runtime
FROM openjdk:17-alpine

# The application's jar file
ARG JAR_FILE=target/HelloWorld-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} HelloWorld-0.0.1-SNAPSHOT.jar

# Add the application's ENTRY POINT FILE
ADD ${ENTRY_POINT_FILE} entry_point.sh

ENTRYPOINT ["sh", "./entry_point.sh"]