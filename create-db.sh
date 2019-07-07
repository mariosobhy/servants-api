#!/bin/bash
set -x
set -e
docker-compose run app rake db:create