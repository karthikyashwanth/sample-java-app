# Stage 1: Build the Java code
FROM openjdk:17-alpine as builder

WORKDIR /build

# Copy source code
COPY src/HelloWorld.java .

# Compile Java file
RUN javac HelloWorld.java

# Stage 2: Use a clean image for running the app
FROM openjdk:17-alpine

WORKDIR /app

# Copy only the compiled .class file, not source or javac
COPY --from=builder /build/HelloWorld.class .

# Run the compiled Java app
CMD ["java", "HelloWorld"]

