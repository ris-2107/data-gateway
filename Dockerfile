FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /app
COPY build/libs/DataGateway-0.0.1-SNAPSHOT.jar /app/DataGateway-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "DataGateway-0.0.1-SNAPSHOT.jar"]
