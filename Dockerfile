FROM eclipse-temurin:latest

EXPOSE 8080

RUN mkdir ./quote-api

COPY ./target/quote-api-0.0.1-SNAPSHOT.jar ./quote-api

ENTRYPOINT ["java", "-jar", "./quote-api/quote-api-0.0.1-SNAPSHOT.jar"]