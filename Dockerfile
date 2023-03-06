FROM maven
WORKDIR source/
COPY . .
CMD ["mvn", "clean", "install"]
