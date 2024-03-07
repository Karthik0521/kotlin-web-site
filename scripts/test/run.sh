#!/usr/bin/env bash
set -e
set +x
set -o pipefail
set -u

cd "$(pwd)" || exit 1

APP_CONTAINER_NAME="kotlin-web-site_test-app"

echo "current containers:"
docker ps

echo "Logs from $APP_CONTAINER_NAME:"
for id in $(docker ps -q)
do
  docker logs "$id"
done

echo "before sleep"
sleep 10
echo "after sleep"

echo "current containers:"
docker ps

echo "Logs from $APP_CONTAINER_NAME:"
for id in $(docker ps -q)
do
  docker logs "$id"
done

docker exec -i "$APP_CONTAINER_NAME" /bin/bash -c "./scripts/test/run-e2e.sh"
