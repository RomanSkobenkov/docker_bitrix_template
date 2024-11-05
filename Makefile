include .env
bash-php:
	@docker exec -it ${COMPOSE_PROJECT_NAME}_php_1 bash

bash-db:
	@docker exec -it ${COMPOSE_PROJECT_NAME}-db-1 bash

rebuild:
	@docker-compose up -d --build

up:
	@docker-compose up -d $(s)

down:
	@docker-compose down $(s)

stop:
	@docker-compose stop $(s)

don:
	@sed -i '/xdebug.mode/s/\=.*/= develop,debug/' ./${PHP_VERSION}/php.ini
	@docker-compose restart php

doff:
	@sed -i '/xdebug.mode/s/\=.*/= develop/' ./${PHP_VERSION}/php.ini
	@docker-compose restart php

pon:
	@sed -i '/xdebug.mode/s/\=.*/= profile/' ./${PHP_VERSION}/php.ini
	@docker-compose restart php

ssl:
	@/bin/bash ssl.sh
	@mv ./nginx/conf/default.conf ./nginx/conf/default-without-ssl.conf
	@mv ./nginx/conf/default-with-ssl.conf ./nginx/conf/default.conf

setup-done:
	@mv ./nginx/conf/default.conf ./nginx/conf/default-before-setup-done.conf
	@mv ./nginx/conf/default-with-urlrewrite.conf ./nginx/conf/default.conf

migrate:
	@docker exec -it ${COMPOSE_PROJECT_NAME}_php_1 php -f /var/www/migrate.php migrate

build-order:
	@docker exec -it ${COMPOSE_PROJECT_NAME}_php_1 bitrix build --path ./local/js/kanzler/order

send-order:
	@docker exec -it ${COMPOSE_PROJECT_NAME}_php_1 php local/tools/cron/orders.php