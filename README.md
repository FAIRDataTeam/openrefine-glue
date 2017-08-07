# openrefine-glue
Glue project to combine OpenRefine and all its extensions into a Docker image.

[![Build Status](https://travis-ci.org/DTL-FAIRData/openrefine-glue.svg?branch=develop)](https://travis-ci.org/DTL-FAIRData/openrefine-glue)

## run
```docker build -t openrefine .```

```docker run --name openrefine -p 3333:3333 -d openrefine```