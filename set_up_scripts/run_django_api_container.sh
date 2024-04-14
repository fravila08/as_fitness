source back-end/.env

./set_up_scripts/run_postgres_container.sh

docker build -t django_img -f docker_files/Dockerfile_django_api .

# Run the PostgreSQL container
docker run --rm --name django_api -d -p 8000:8000 -v /Users/franciscoavila/Desktop/AsFitness/back-end:/back-end --link postgres:$DJ_DB_HOST django_img

docker exec -it django_api python manage.py makemigrations

docker exec -it django_api python manage.py migrate