# Dockerfile for production environment

FROM node:alpine as builder
# build directory is created in this directory
WORKDIR '/app' 
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# this takes the built project and runs it on nginx server using another image
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
