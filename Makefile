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
	docker exec -it $(SERVICE_NAME) mongosh --quiet --file $(DATABASE_INIT)

	@echo "Populating MongoDB database"
	docker exec -it $(SERVICE_NAME) mongosh --quiet --file $(DATABASE_POPULATION)

test-db:
	@echo "Testing the collections in the database"
	docker exec -it $(SERVICE_NAME) mongosh --quiet --eval "db.getCollectionNames()" $(DATABASE)

	@echo "Counting documents in each collection"
	docker exec -it $(SERVICE_NAME) mongosh --quiet --eval 'db.getCollectionNames().forEach(function(c) { print(c + ": " + db[c].countDocuments() + " documents"); });' $(DATABASE)

access-db:
	@echo "Accessing MongoDB shell"
	docker exec -it $(SERVICE_NAME) mongo --username $(USER) --password $(PASSWORD)

down:
	@echo "Stopping MongoDB service and removing containers"
	docker compose -f $(DOCKER_COMPOSE_FILE) down

backup:
	@echo "Creating backup of MongoDB"
	docker exec -it $(SERVICE_NAME) mongodump --db $(DATABASE) --out /data/backup/
	docker cp $(SERVICE_NAME):/data/backup ./mongo_project/dump/

export:
	@echo "Exporting collections to JSON files"
	@for file in $(FILES); do \
	    docker exec -it $(SERVICE_NAME) mongoexport --db $(DATABASE) --collection $$file --out ./mongo_project/export_csv/$$file.json --jsonArray; \
	done
