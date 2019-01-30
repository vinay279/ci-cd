# THIS IS THE DOCKERFILE FOR  PRODUCTION having two base image 
# dockerfile for the production environment
# build phase of the docker
FROM node:alpine AS builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build
 
# run phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
# copy the build folder from builder container to 
# nginx/html folder to run application
# default port of the nginx is 80
#new line at last
#all is well 
