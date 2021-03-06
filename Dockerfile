FROM nginx:latest
MAINTAINER Jerry Li "jerry2096@gmail.com" 
RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types
COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types
COPY default /etc/nginx/sites-enabled/default

# add vim and netstat support
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "net-tools"]

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80

CMD ["nginx"]

