include .env

SERVICE_NAME=mongodb
HOST=127.0.0.1
PORT=27017

USER=${MONGO_INITDB_ROOT_USERNAME}
PASSWORD=${MONGO_INITDB_ROOT_PASSWORD}
DATABASE=${MONGO_INITDB_DATABASE}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=./mongo_project/database_creation.json
DATABASE_POPULATION=./mongo_project/population.json

.PHONY: all up objects test-db access-db down export backup

all: info up objects

info:
	@echo "This is a project for MongoDB database: $(DATABASE)"

up:
	@echo "Starting MongoDB service with Docker"
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d --build

	@echo "Waiting for MongoDB to be ready..."
	bash mongo_wait.sh

	@echo "Creating and populating MongoDB database"
	docker exec -it $(SERVICE_NAME) mongoimport --db $(DATABASE) --collection myCollection --file $(DATABASE_CREATION) --jsonArray
	docker exec -it $(SERVICE_NAME) mongoimport --db $(DATABASE) --collection myCollection --file $(DATABASE_POPULATION) --jsonArray

objects:
	@echo "Inserting objects into the database"
	@for file in $(FILES); do \
	    echo "Processing $$file and inserting into the database $(DATABASE)"; \
	    docker exec -it $(SERVICE_NAME) mongoimport --db $(DATABASE) --collection $$file --file ./mongo_project/objects/$$file.json --jsonArray; \
	done

test-db:
	@echo "Testing the collections in the database"
	docker exec -it $(SERVICE_NAME) mongo --eval "db.getCollectionNames()"

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
