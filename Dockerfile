# Use Docker Image: Node 16
FROM node:16-alpine

# Select work directory
WORKDIR /usr/src/app

# Update apk
RUN apk update && apk add bash

# Install ExpoCLI
RUN yarn global add expo-cli
RUN yarn install
