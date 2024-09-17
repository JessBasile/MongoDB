#!/bin/bash
echo "Waiting for MongoDB to be ready..."
until docker exec -it mongodb mongo --eval "print(\"waited for connection\")"
do
    echo "Waiting for MongoDB..."
    sleep 2
done
echo "MongoDB is ready!"