#!/bin/bash

echo "Waiting for MongoDB to be ready..."
while ! nc -z localhost 27017; do
    echo "Waiting for MongoDB..."
    sleep 2
done

echo "MongoDB is ready!"
