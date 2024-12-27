# Build stage
FROM maven:3.8.6-openjdk-11-slim AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Final stage
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the .jar file from the build stage
COPY --from=build /app/target/my-app-1.0.0.jar /app/app.jar


EXPOSE 7079
ENTRYPOINT ["java", "-jar", "app.jar"]
 
