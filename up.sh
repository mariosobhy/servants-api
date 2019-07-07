#!/bin/bash
# docker-compose up --force-recreate --build -d
docker-compose up --build -d
docker-compose logs -f