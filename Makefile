include .env

SERVICE_NAME=mongodb
HOST=127.0.0.1
PORT=27017

USER=${MONGO_INITDB_ROOT_USERNAME}
PASSWORD=${MONGO_INITDB_ROOT_PASSWORD}
DATABASE=${MONGO_INITDB_DATABASE}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_INIT=./mongo_project/init.js
DATABASE_POPULATION=./mongo_project/population.js

.PHONY: all up objects test-db access-db down export backup

all: info up objects

info:
	@echo "This is a project for MongoDB database: $(DATABASE)"

up:
	@echo "Iniciando servicio MongoDB con Docker..."
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d --build
	@echo "Esperando a que MongoDB esté listo..."
	bash mongo_wait.sh
	@echo "Creando colecciones en la base de datos MongoDB..."
	docker exec -it $(SERVICE_NAME) mongosh "mongodb://$(USER):$(PASSWORD)@localhost:27017/$(DATABASE)?authSource=admin" --quiet --file $(DATABASE_INIT)
	@echo "Poblando la base de datos MongoDB..."
	docker exec -it $(SERVICE_NAME) mongosh "mongodb://$(USER):$(PASSWORD)@localhost:27017/$(DATABASE)?authSource=admin" --quiet --file $(DATABASE_POPULATION)

test-db:
	@echo "Testing the collections in the database"
	docker exec -it $(SERVICE_NAME) mongosh --quiet --username $(MONGO_INITDB_ROOT_USERNAME) --password $(MONGO_INITDB_ROOT_PASSWORD) --authenticationDatabase admin --eval "db.getCollectionNames().forEach(function(c) { print('Collection: ' + c); var count = db[c].find({}).count(); print(c + ': ' + count + ' documents'); });" $(MONGO_INITDB_DATABASE)

access-db:
	@echo "Accessing MongoDB shell"
	docker exec -it $(SERVICE_NAME) mongo --username $(USER) --password $(PASSWORD)

down:
	@echo "Stopping MongoDB service and removing containers"
	docker compose -f $(DOCKER_COMPOSE_FILE) down

backup:
	@echo "Creating backup of MongoDB"
	docker exec -it $(SERVICE_NAME) /bin/bash -c "mkdir -p /data/backup/"
	docker exec -it $(SERVICE_NAME) mongodump --username $(USER) --password $(PASSWORD) --authenticationDatabase admin --db $(DATABASE) --archive=/data/backup/backup.archive
	docker cp $(SERVICE_NAME):/data/backup/backup.archive ./mongo_project/dump/

export:
	@echo "Exporting collections to JSON files"
	@for file in $(FILES); do \
	    docker exec -it $(SERVICE_NAME) mongoexport --username $(USER) --password $(PASSWORD) --authenticationDatabase admin --db $(DATABASE) --collection $$file --out ./mongo_project/export_csv/$$file.json --jsonArray; \
	done
