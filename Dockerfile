 FROM openjdk:11-jre-slim
WORKDIR /app
COPY build/libs/app.jar /app/app.jar
CMD ["java", "-jar", "app.jar"]
