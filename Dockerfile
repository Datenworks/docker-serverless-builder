FROM python:3.7.4-slim-buster
LABEL maintainer="operations@datenworks.com"

RUN pip install pipenv awscli && \
    apt-get update && \
    apt-get install npm bash -y && \
    npm install serverless -g && \
    npm install serverless-python-requirements -g && \
    # Clean-up the apt-get cache/index
    rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/*

COPY docker-entrypoint.sh /docker-entrypoint.sh
WORKDIR /opt/serverless

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
