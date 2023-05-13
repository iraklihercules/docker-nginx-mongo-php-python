
# Main app
.PHONY:
up:
	docker-compose up -d

.PHONY:
down:
	docker-compose down

.PHONY:
restart:
	docker-compose stop
	docker-compose start


# PHP
.PHONY:
php-shell:
	docker exec -it hercules_phpfpm bash


# Python
.PHONY:
python-shell:
	docker exec -it hercules_python bash

.PHONY:
run-python-script:
	docker exec hercules_python bash -c 'python /app/main.py'


# Database
.PHONY:
mongo-shell:
	docker exec -it hercules_mongo bash

.PHONY:
db-clear:
	rm -rf mongo/live_data/*
