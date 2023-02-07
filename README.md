## INCEPTION

System administration project using Docker to virtualize several Docker images. This project was done using a debian-buster virtual machine.

All the Docker images for each service are built from debian:buster, no ready-made images from DockerHub

### Guidelines

The project sets up:

* A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
* A Docker container that contains WordPress + php-fpm (it must be installed and
configured) only without nginx.
* A Docker container that contains MariaDB only without nginx.
* A volume that contains your WordPress database.
* A second volume that contains your WordPress website files.
* A docker-network that establishes the connection between your containers

Here is diagram showing the network:

![network diagram](network%20diagram.png)

