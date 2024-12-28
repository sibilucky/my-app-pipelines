 # Stage 1: Build Stage
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and the source code into the container
COPY pom.xml .

# Copy the source code to the container
COPY src ./src

# Run Maven to build the project and produce the JAR file
RUN mvn clean package && ls /app/target

# Stage 2: Run Stage
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Create a non-root user for security reasons
RUN useradd -m appuser

# Switch to the non-root user
USER appuser

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar /app/app.jar

# Expose the port the app will run on
EXPOSE 7079

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
