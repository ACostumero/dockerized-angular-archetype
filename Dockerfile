# Use the official Node.js image as the base image
ARG NODE_IMAGE
FROM node:${NODE_IMAGE} AS builder

# Set the working directory
WORKDIR /usr/src/app

# Install Angular CLI globally
ARG ANGULAR_CLI_VERSION
RUN npm install -g @angular/cli@${ANGULAR_CLI_VERSION}

# Expose port 4200 for Angular development server
EXPOSE 4200

# Command to keep the container running
CMD ["tail", "-f", "/dev/null"]
