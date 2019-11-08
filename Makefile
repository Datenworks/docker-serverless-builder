.PHONY: build push

PYTHON_VERSION := 3.7.4
DOCKER_IMAGE_REPO := docker.io
DOCKER_IMAGE_NAME := serverless-builder
DOCKER_IMAGE_TAG := python-${PYTHON_VERSION}

build:
	docker build -t ${DOCKER_IMAGE_REPO}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .

push: build
	docker push ${DOCKER_IMAGE_REPO}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
