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

### Build

A makefile is included so you can simply ```make``` to start building the image and running the containers. also you can:
* ```make list``` : list the running containers, images, and active networks.
* ```make clean``` : deletes containers, images, volumes and networks
* ```make prune``` :  removes all unused containers, networks, images and optionally, volumes.
* ```make down``` : docker-compose down

### Notes

***the .env file present in the srcs folder is for demonstration purposes only. Always make sure to include it in the .gitignore.***