#
# Build stage
#
FROM maven AS build
WORKDIR source/
COPY . .
CMD ["mvn", "clean", "install"]
#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /source/target/web_app.war .
EXPOSE 8080
ENTRYPOINT ["java","-jar","/source/target/web_app.war"]


