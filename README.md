docker-nginx (test only)
============

A high-performance Nginx base image for Docker to serve static websites. It will serve anything in the `/var/www` directory.

To build a Docker image for your site, you'll need to create a `Dockerfile`. For example, if your site is in a directory called `src/`, you could create this `Dockerfile`:

    FROM nginx:latest
    COPY src/ /var/www
    CMD 'nginx'

Then build and run it:

    $ docker build -t mysite .
    ...
    Successfully built 5ae2fb5cf4f8
    $ docker run -p 80:80 -d mysite
    da809981545f
    $ curl localhost
    ...

SSL
---

To use SSL, put your certs in `/etc/nginx/ssl` and enable the `default-ssl` site:

    ADD server.crt /etc/nginx/ssl/
    ADD server.key /etc/nginx/ssl/
    RUN ln -s /etc/nginx/sites-available/default-ssl /etc/nginx/sites-enabled/default-ssl

When you run it, you'll want to make port 443 available, e.g.:

    $ docker run -p 80:80 -p 443:443 -d mysite

