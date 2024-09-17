#!/bin/bash

echo "Waiting for MongoDB to be ready..."
until docker exec mongodb mongo --eval "print('waited for connection')" > /dev/null 2>&1
do
    echo "Waiting for MongoDB..."
    sleep 2
done

echo "MongoDB is ready!"