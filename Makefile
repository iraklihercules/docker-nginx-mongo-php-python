
MONGO_DATABASE = hercules_database
MONGO_USERNAME = test
MONGO_PASSWORD = test


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

.PHONY:
db-dump:
	docker exec \
		-e MONGO_DATABASE=$(MONGO_DATABASE) \
		-e MONGO_USERNAME=$(MONGO_USERNAME) \
		-e MONGO_PASSWORD=$(MONGO_PASSWORD) \
		hercules_mongo bash -c '/dump/generate.sh'

.PHONY:
db-restore:
	docker exec \
		-e MONGO_DATABASE=$(MONGO_DATABASE) \
		-e MONGO_USERNAME=$(MONGO_USERNAME) \
		-e MONGO_PASSWORD=$(MONGO_PASSWORD) \
		hercules_mongo bash -c '/dump/populate.sh'

.PHONY:
db-export:
	docker exec \
		-e MONGO_DATABASE=$(MONGO_DATABASE) \
		-e MONGO_USERNAME=$(MONGO_USERNAME) \
		-e MONGO_PASSWORD=$(MONGO_PASSWORD) \
		hercules_mongo bash -c '/dump/export.sh'
