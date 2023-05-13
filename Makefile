
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
