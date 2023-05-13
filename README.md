# Docker Template with Nginx, PHP and MongoDB #

This is a basic Docker template with `Nginx` `PHP-FPM` `MongoDB` and `Mongo Express` services.

* [http://localhost:8080](http://localhost:8080) - Website
* [http://localhost:8081](http://localhost:8081) - Mongo Express

### 1. What the app does ###

1. Creates a collection
2. Inserts 2 users
3. Gets one user back
4. Displays the user

```
Array
(
    [username] => John Doe
    [email] => john.doe@example.com
    [created_on] => {creation_date}
)
```


### 2. Software requirements ###

* [Git](https://git-scm.com/)
* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)


### 3. How to run the project ###

* Clone the repository
* Enter the project directory
* Run `docker-compose up -d` or `make up` (Make command may require installation).


### 4. Recipes ###

```bash
make up  # Build and run containers
make down  # Stop and remove containers
make restart  # Restart containers

make php-shell  # Open the PHP container's shell

make mongo-shell  # Open the MongoDB container's shell
make db-clear  # Delete data in the database (requires containers restart)
```

### 5. Using MongoDB Clients ###

To connect to the database with any desktop client, use this details:
```yaml
Server: localhost
Post: 27017
Authentication Mode: SCRAM-SHA-256
User name: test
Password: test
Authentication DB: admin
```
