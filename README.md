<a href="https://www.datenworks.com">
    <img align="right" src="https://datenworks.com/img/logo.png" >
</a>

# Docker Serverless Builder

## Overview

Docker image responsible for handling Serverless commands executions. Lightweight and lean implementation over Docker.

Extending from the default Python 3.7.4 image with Buster (Debian 10), installing default Node and NPM from Debian's index.

NOTE: A compressed zip for the project requirements is necessary in order to be uploaded to AWS S3 bucket.
This zip file must be behind the limits for AWS Lambda, one of them are size (<250MB)

To manage this zip file, the [serverless-python-requirements](https://github.com/UnitedIncome/serverless-python-requirements) plugin is installed.

### Why is this necessary?

In order to have the same "environment" accross builds, it was important for us to create this image in order to have reproduceable builds/releases.

## Getting Started

### Requirements

In order to run this container, some tools are necessary:
 - docker (18.0+ preferably)
 - make (CMake, GNU Make or BSD Make)

### Building & Pushing this image to registry

You'll find a [makefile](Makefile) in the repository root to help with the next steps

```bash
make DOCKER_IMAGE_REPO=some.registry.com/janedoe push # Executes Docker image build as a dependency
```

### Running

The execution can be parameterized to facilitate the hand-work. e.g.:

```bash
docker run -t --rm -v "/path/to/serverless/repo" \
    -e LETS_IMAGINE="your variables" \
    -e ARE_LIKE="these" \
    -e ENV=dev
    -e SERVERLESS_COMMAND=deploy
    "${DOCKER_REPO}/serverless-builder:python-${AVAILABLE_PYTHON_VERSION}"
```

# THAT'S ALL!
