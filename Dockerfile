# Use an official Maven image as the base image
FROM maven:3.8.6-openjdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and the source code to the container
COPY pom.xml /app/

# Run Maven to build the project (it will create a target directory with the compiled JAR)
RUN mvn clean package -DskipTests

# Use an official OpenJDK image as a base image for running the application
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file built in the build step into the final image
COPY --from=build /app/target/*.jar /app/app.jar

# Expose the port the application will run on (optional, adjust as needed)
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
