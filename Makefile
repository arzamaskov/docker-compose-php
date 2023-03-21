PATH := $(shell pwd)/bin:$(PATH)
include .env

up:
	docker-compose up -d --remove-orphans

stop:
	docker-compose stop

down:
	docker-compose down

ps:
	docker-compose ps

logs:
	docker-compose logs --tail=100 -f nginx || true

dblogs:
	docker-compose logs --tail=100 -f db || true
