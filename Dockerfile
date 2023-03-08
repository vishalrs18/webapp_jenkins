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
FROM tomcat:8.5.35-jre10
COPY --from=build source/webapp_jenkins/target/web_app.war /usr/local/tomcat/webapps/
EXPOSE 8080
RUN chmod +x /usr/local/tomcat/bin/catalina.sh
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

