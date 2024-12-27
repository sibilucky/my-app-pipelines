# Build stage
FROM maven:3.8.6-openjdk-11-slim AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Final stage
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the .jar file from the build stage
COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE 7079
ENTRYPOINT ["java", "-jar", "app.jar"]
 
