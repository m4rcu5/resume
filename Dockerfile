# Base our image on a minimal Nginx container
FROM nginx:alpine

# Add the build artifacts to the container
ADD build/ /usr/share/nginx/html/
