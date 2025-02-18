#!/bin/bash

if [ "$1" == "init" ]; then
  # start up docker containers
  docker compose -p chis-interop -f ./docker/docker-compose.yml -f ./docker/docker-compose.mediator.yml -f ./docker/docker-compose.openmrs.yml up -d --build
elif [ "$1" == "up" ]; then
  docker compose -p chis-interop -f ./docker/docker-compose.yml -f ./docker/docker-compose.mediator.yml -f ./docker/docker-compose.openmrs.yml up -d
elif [ "$1" == "up-dev" ]; then
  docker compose -p chis-interop -f ./docker/docker-compose.yml -f ./docker/docker-compose.mediator.yml -f ./docker/docker-compose.openmrs.yml up -d --build
elif [ "$1" == "down" ]; then
  docker compose -p chis-interop -f ./docker/docker-compose.yml -f ./docker/docker-compose.mediator.yml  -f ./docker/docker-compose.cht-core.yml -f ./docker/docker-compose.openmrs.yml stop
elif [ "$1" == "destroy" ]; then
  docker compose -p chis-interop -f ./docker/docker-compose.yml -f ./docker/docker-compose.mediator.yml  -f ./docker/docker-compose.cht-core.yml -f ./docker/docker-compose.openmrs.yml down -v
elif [ "$1" == "up-test" ]; then
  docker compose -p chis-interop -f ./docker/docker-compose.yml -f ./docker/docker-compose.mediator.yml  -f ./docker/docker-compose.cht-core.yml -f ./docker/docker-compose.openmrs.yml up -d --build
else 
  echo "Invalid option $1
  
  Help:

  init      starts the docker containers and configures OpenHIM
  up        starts the docker containers
  up-dev    starts the docker containers with updated files.
  down      stops the docker containers
  destroy   shutdown the docker containers and deletes volumes
  "
fi
