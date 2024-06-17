CR := docker
VERSION := 1
NAME := kevinharv/httpd
TAG := $(NAME):$(VERSION)

run:
	$(CR) compose up -d
	make logs

logs:
	$(CR) compose logs -f

build:
	$(CR) compose build

stop:
	$(CR) compose down

restart: stop build run

push:
	$(CR) build -t kevharv/httpd-enterprise:latest .
	$(CR) push kevharv/httpd-enterprise:latest

clean:
	$(CR) system prune -a --filter "until=24h"