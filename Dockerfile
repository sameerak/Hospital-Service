FROM maven:3-openjdk-8 AS build
RUN mkdir /usr/src/project
COPY . /usr/src/project
WORKDIR /usr/src/project
RUN mvn clean package -DskipTest

FROM openjdk:8-jre-slim
RUN mkdir /project
COPY --from=build /usr/src/project/target/Hospital-Service-2.0.0.jar /project/
WORKDIR /project
EXPOSE 8080
CMD java -jar Hospital-Service-2.0.0.jar
