#!/bin/bash

# Source the .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env file not found"
    exit 1
fi

# Print environment variables for debugging
echo "MONGO_INITDB_ROOT_USERNAME=$MONGO_INITDB_ROOT_USERNAME"
echo "MONGO_INITDB_ROOT_PASSWORD=$MONGO_INITDB_ROOT_PASSWORD"

# Wait until MongoDB is ready
until docker exec mongodb mongo --username $MONGO_INITDB_ROOT_USERNAME --password $MONGO_INITDB_ROOT_PASSWORD --authenticationDatabase admin --eval "db.runCommand('ping')"
do
    echo "Waiting for MongoDB to be ready..."
    sleep 2
done

echo "MongoDB is ready."
