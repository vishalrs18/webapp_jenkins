FROM ubuntu
WORKDIR source/
COPY . source/
RUN apt install maven
CMD ["mvn", "clean", "install"]
