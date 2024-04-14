docker build -t react_img -f docker_files/Dockerfile_react_fe .

docker run --rm --name react -d -p 80:80 -v /Users/franciscoavila/Desktop/AsFitness/front-end/dist:/usr/share/nginx/html react_img 