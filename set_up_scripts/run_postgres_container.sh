#!/bin/zsh

# Source the .env file
source back-end/.env

# Build the PostgreSQL Docker image
docker build -t postgres_img -f docker_files/Dockerfile_postgresql .

# Run the PostgreSQL container
docker run -e POSTGRES_PASSWORD=$DB_PASSWORD -e POSTGRES_DB=$DB_NAME -e POSTGRES_USER=$DB_USER --rm --name postgres -d -p $DB_PORT:5432 postgres_img

# Connect to the PostgreSQL database using psql
psql -h localhost -p $DB_PORT -d $DB_NAME -U $DB_USER -W