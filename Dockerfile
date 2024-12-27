 # Use an official Maven image with OpenJDK to build the project
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .


# Run Maven to build the project
RUN mvn clean package -DskipTests

# Use a smaller OpenJDK JRE image to run the app
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port that the app listens on
EXPOSE 7079

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
