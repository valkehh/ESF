# Base image
FROM node:20-alpine as base

# Builder stage
FROM base as builder
WORKDIR /home/node/app

# Copy package.json and yarn.lock
COPY package*.json yarn.lock ./

# Install dependencies and build the application
RUN yarn install
COPY . .
RUN npm run build

# Expose the application port
EXPOSE 3000
EXPOSE 80

# Command to run the application
CMD ["node", "dist/server.js"]
