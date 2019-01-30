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
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# default port of the nginx is 80
#new line at last
#all is well 
