 # Using Maven base image
FROM maven:3.8.6-openjdk-11 AS build

WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml /app/

# Build the project, specifying the goal (clean and install)
RUN mvn clean install -DskipTests

# Use a smaller OpenJDK image for the final container
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/my-app.jar /app/app.jar
EXPOSE 7079
ENTRYPOINT ["java", "-jar", "app.jar"]
