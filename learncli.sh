#!/bin/bash
docker compose pull "${1:-osenv}"
docker compose run --rm "${1:-osenv}"
