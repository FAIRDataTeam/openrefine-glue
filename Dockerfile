FROM openjdk:8-alpine

# setup
RUN apk --no-cache add git bash wget

# get tools
RUN git clone --depth 1 --branch master https://github.com/openrefine/openrefine /opt/openrefine ; \
    rm -rf /opt/openrefine/.git
RUN git clone --depth 1 --branch master https://github.com/DTL-FAIRData/orefine-rdf-extension /tmp/orefine-rdf-extension
RUN git clone --depth 1 --branch master https://github.com/DTL-FAIRData/orefine-fair-extension /tmp/orefine-fair-extension

# build
RUN /opt/openrefine/refine build

# cleanup
RUN apk del git
RUN rm -rf /tmp/*
RUN rm -rf /opt/openrefine/tools

# run
EXPOSE 3333
ENTRYPOINT ["/opt/openrefine/refine", "run", "-i", "0.0.0.0", "-x", "refine.headless=true"]