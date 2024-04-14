docker-compose --env-file ./back-end/.env -f docker-compose.yml up --build

docker exec -it asfitness-django_api-1 python manage.py makemigrations

docker exec -it asfitness-django_api-1 python manage.py migrate
