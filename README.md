# Docker Template with Nginx and PHP #

This is a basic Docker template with `Nginx` and `PHP-FPM` services.


### 1. Software requirements ###

* [Git](https://git-scm.com/)
* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)


### 2. How to run the project ###

* Clone the repository
* Enter the project directory
* Run `docker-compose up -d` or `make up` (Make command may require installation).

Access the website on [http://localhost:8080](http://localhost:8080)


### 3. Recipes ###

```bash
make up  # Build and run containers
make down  # Stop and remove containers
make restart  # Restart containers

make php-shell  # Open the PHP container's shell
```
