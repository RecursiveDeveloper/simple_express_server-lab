#!/bin/bash

echo -e "*****Creating resources\n"
docker compose --env-file .env.dev up -d