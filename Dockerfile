FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /app
COPY build/libs/DataGateway-0.0.1-SNAPSHOT.jar /app/DataGateway-0.0.1-SNAPSHOT.jar

# Add environment variables
ENV CLUSTER_TYPE=cloud_tst \
    REDIS_HOST=172.17.0.4

ENTRYPOINT ["java", "-jar", "DataGateway-0.0.1-SNAPSHOT.jar"]
