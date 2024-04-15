# Workflows

## Overview

This repository currently conducts two separate workflows: secrets, and pages. Each workflow works as an isolated flow utilizes Github Secrets to provide environment variables to projects.

## Environment Variables

- Back-End

```bash
# These secrets will be used by Docker, Django, and PostgreSQL and the file should 
# live within the back-end directory
DJANGO_SECRET_KEY="str"
DB_NAME="str"
DB_HOST="str"
DB_PORT="int"
DB_USER="str"
DB_PASSWORD="str"
DJ_DB_HOST="str"
DJ_DB_PORT="int"
```

- Front-End

```bash
# These variables will be utilized by the Vite+React project
VITE_DEPLOY="bool"
```

## Secrets

This workflow proves the presence of your repository secrets within github. If you'd like to set your repository secrets from your `.env` on your local machine you could utilize gh to do so.

```bash
cat .env | while IFS='=' read -r name value; do
  gh secret set "$name" -b "$value"
done
```

## Pages

This workflow builds the current state of the `front-end` directory and hosts it on [https://fravila08.github.io/as_fitness/](https://fravila08.github.io/as_fitness/) through github pages. Please refer to the vite documentation on [deploying static pages](https://vitejs.dev/guide/static-deploy#github-pages) to understand this workflows functionality.
