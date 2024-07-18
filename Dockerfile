# Use the official Node.js image.
# https://hub.docker.com/_/node
FROM node:16.13.2-alpine

# Use docker images from AWS, to avoid docker pull rate limit
# `aws codebuild list-curated-environment-images`
# FROM aws/codebuild/amazonlinux2-x86_64-standard:4.0 // doesn't exist

# Create and change to the app directory.
WORKDIR /usr/src/app

# Install PM2 globally
# RUN npm install -g pm2

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy local code to the container image.
COPY . .

# Build the project (adjust this command based on your build script)
RUN npm run build-nsl

# indicates the ports on which a container listens for connections
# match the target group's port on ECS cluster
ARG REACT_APP_PORT
EXPOSE ${REACT_APP_PORT}

# define the command to run your app using CMD which defines your runtime.
# Here we will use node server.js to start your server:
# CMD ["pm2-runtime","start","process_prod.yml"]
CMD ["npm", "run", "prod", "--", "-p", ${REACT_APP_PORT}]
### trigger code pipeline