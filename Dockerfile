# Use an official Maven image as the base image
FROM maven:3.8.6-openjdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and the source code to the container
COPY pom.xml /app/

# Run Maven to build the project (it will create a target directory with the compiled JAR)
RUN mvn clean package -DskipTests
