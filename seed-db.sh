#!/bin/bash
set -x
set -e
docker-compose run app rails db:seed