#!/bin/bash
set -e

echo "[start_agent.sh] Запуск docker-compose..."

docker-compose --env-file .env up --build