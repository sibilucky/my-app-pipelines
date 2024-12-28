 FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file from the host machine
COPY target/microservice-1.0.0.jar /app/app.jar

# Expose the port the app will run on
EXPOSE 7079

# Run the JAR file using the -jar option (which is typical for JAR execution)
ENTRYPOINT ["java", "-jar", "app.jar"]
