#!/bin/bash

cd /opt/serverless
# Ensure that the plugins is installed
serverless plugin install --name serverless-python-requirements
npm install

serverless deploy
