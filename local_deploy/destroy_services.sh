#!/bin/bash

echo -e "\n*****Removing resources\n"
docker compose --env-file .env.dev down -v --rmi all --volumes