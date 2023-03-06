FROM maven AS build
WORKDIR source/
COPY . .
CMD ["mvn", "clean", "install"]

FROM java
COPY --from=build /source/target/web_app.war .
RUN java -jar web_app.war


