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
	@echo "Starting MongoDB service with Docker"
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d --build

	@echo "Waiting for MongoDB to be ready..."
	bash mongo_wait.sh

	@echo "Creating collections in MongoDB database"
	docker exec -it $(SERVICE_NAME) mongosh "mongodb://$(USER):$(PASSWORD)@localhost:27017/$(DATABASE)?authSource=admin" --quiet --file $(DATABASE_INIT)

	@echo "Populating MongoDB database"
	docker exec -it $(SERVICE_NAME) mongosh "mongodb://$(USER):$(PASSWORD)@localhost:27017/$(DATABASE)?authSource=admin" --quiet --file $(DATABASE_POPULATION)

test-db:
	@echo "Testing the collections in the database"
	docker exec -it $(SERVICE_NAME) mongosh --quiet --username $(MONGO_INITDB_ROOT_USERNAME) --password $(MONGO_INITDB_ROOT_PASSWORD) --authenticationDatabase admin --eval "db.getCollectionNames().forEach(function(c) { print('Collection: ' + c); var count = db[c].find({}).count(); print(c + ': ' + count + ' documents'); });" $(MONGO_INITDB_DATABASE)

test-collections:
	@echo "Showing data for each collection in the MongoDB database"
	docker exec -it mongodb mongosh "mongodb://root:jess123@localhost:27017/CV_Jesica_Basile?authSource=admin" --quiet --eval "\
		print('datos_personales:'); \
		db.datos_personales.find().forEach(printjson); \
		print('experiencia_profesional:'); \
		db.experiencia_profesional.find().forEach(printjson); \
		print('formacion_academica:'); \
		db.formacion_academica.find().forEach(printjson); \
		print('certificaciones:'); \
		db.certificaciones.find().forEach(printjson); \
		print('formacion_docente:'); \
		db.formacion_docente.find().forEach(printjson); \
		print('experiencia_docente:'); \
		db.experiencia_docente.find().forEach(printjson); \
	"

access-db:
	@echo "Accessing MongoDB shell"
	docker exec -it $(SERVICE_NAME) mongo --username $(USER) --password $(PASSWORD)

down:
	@echo "Stopping MongoDB service and removing containers"
	docker compose -f $(DOCKER_COMPOSE_FILE) down

backup:
    @echo "Creating backup of MongoDB"
    docker exec -it mongodb /bin/bash -c "mkdir -p /data/backup/"
    docker exec -it mongodb mongodump --username root --password jess123 --authenticationDatabase admin --db CV_Jesica_Basile --archive=/data/backup/backup.archive
    mkdir -p ./mongo_project/dump/
    docker cp mongodb:/data/backup/backup.archive ./mongo_project/dump/

export:
	@echo "Exporting collections to JSON files"
	@for file in $(FILES); do \
	    docker exec -it $(SERVICE_NAME) mongoexport --username $(USER) --password $(PASSWORD) --authenticationDatabase admin --db $(DATABASE) --collection $$file --out ./mongo_project/export_csv/$$file.json --jsonArray; \
	done
