FROM adoptopenjdk/openjdk11
VOLUME /tmp
COPY target/config-service-1.0.jar ConfigServer.jar
ENTRYPOINT ["java", "-jar", "ConfigServer.jar"]