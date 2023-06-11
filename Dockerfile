FROM adoptopenjdk/openjdk11
RUN ["mkdir", "/var/log/config-service"]
RUN ["chmod", "755", "/var/log/config-service"]
VOLUME /data1/config-service /var/log/config-service
COPY target/config-service-1.0.2.jar ConfigServer.jar
ENTRYPOINT ["java", "-Dspring.profiles.active=dev", "-jar", "ConfigServer.jar"]