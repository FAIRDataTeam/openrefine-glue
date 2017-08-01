FROM openjdk:8-alpine

# build and cleanup
COPY setup.sh /opt/setup.sh
RUN chmod +x /opt/setup.sh
RUN /opt/setup.sh

# run
WORKDIR /opt/openrefine
ENTRYPOINT ["./refine", "-i", "0.0.0.0", "-x", "refine.headless=true"]
EXPOSE 3333