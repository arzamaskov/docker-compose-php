PATH := $(shell pwd)/bin:$(PATH)
include .env

up:
	docker-compose up -d --remove-orphans

stop:
	docker-compose stop

restart:
	docker-compose restart

down:
	docker-compose down

ps:
	docker-compose ps

logs:
	docker-compose logs --tail=100 -f nginx || true

dblogs:
	docker-compose logs --tail=100 -f db || true

restore:
	./bin/mysql-docker-restore

# make fix name=app/index.php
fix:
	docker-compose run --rm php-fpm bash -c "php-cs-fixer fix $(name)"

console:
	docker-compose run --rm php-fpm bash
