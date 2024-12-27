 # Use a base image with OpenJDK
FROM openjdk:11-jre-slim as build

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file from the host machine
COPY target/my-app-1.0.0.jar /app/app.jar

# Expose the port the app will run on
EXPOSE 7079

# Set the entry point to run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
