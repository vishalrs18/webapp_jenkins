FROM ubuntu
WORKDIR source/
COPY . source/
RUN sudo apt install maven
CMD ["mvn", "clean", "install"]
