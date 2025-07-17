FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY . .

RUN ./mvnw package -DskipTests

EXPOSE 8080

CMD ["java", "-jar", "target/spring-petclinic-3.1.0.jar"]
