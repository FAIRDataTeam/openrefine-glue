#!/bin/sh

# setup
apk --no-cache add bash wget git maven unzip

# get sources
git clone --depth 1 --branch master https://github.com/openrefine/openrefine /opt/openrefine
git clone --depth 1 --branch master https://github.com/DTL-FAIRData/openrefine-maven-shim /tmp/openrefine-maven-shim
git clone --depth 1 --branch master https://github.com/DTL-FAIRData/orefine-rdf-extension /tmp/orefine-rdf-extension
git clone --depth 1 --branch master https://github.com/DTL-FAIRData/orefine-fair-extension /tmp/orefine-fair-extension

# build openrefine jar
/opt/openrefine/refine linux_dist 2.7
mvn --quiet install:install-file -Dfile=/opt/openrefine/build/openrefine-2.7.jar -DpomFile=/tmp/openrefine-maven-shim/pom.xml

# build rdf extension
cd /tmp/orefine-rdf-extension
mvn --quiet verify -Dmaven.test.skip=true && mvn --quiet assembly:single
unzip -q -d /opt/openrefine/extensions/rdf-extension target/orefine-rdf-extension-1.0.0-SNAPSHOT-openrefine-module.zip

# build openrefine
/opt/openrefine/refine build

# cleanup
apk del git maven unzip
rm -rf /tmp/*
rm -rf /opt/openrefine/.git
rm -rf /opt/openrefine/tools
rm -rf /opt/openrefine/build
rm -rf /opt/openrefine/dist
rm -rf /opt/openrefine/main/tests
rm -rf /opt/openrefine/main/webapp/WEB-INF/lib-src
rm -rf /root/.m2

cd -