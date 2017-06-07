# Base our image on a minimal Nginx container
FROM nginx:alpine

# Add the webcontent artifact to the container
ADD webcontent.tar.gz /usr/share/nginx/html/
RUN ln -sf	/usr/share/nginx/html/Marcus_van_Dam.html \
           	/usr/share/nginx/html/index.html
