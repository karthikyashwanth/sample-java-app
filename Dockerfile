# Use a base image with Java
FROM openjdk:17-alpine

# Set working directory
WORKDIR /app

# Copy source code
COPY src/HelloWorld.java .

EXPOSE 8080

# Compile the Java code
RUN javac HelloWorld.java

# Set the command to run the app
CMD ["java", "HelloWorld"]
