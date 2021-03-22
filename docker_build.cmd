#!/bin/bash
docker build -f Dockerfile.prod -t svelte-min-pack .
docker run --name temp svelte-min-pack
docker cp temp:/app/dist ./dist
docker rm temp
docker image rm svelte-min-pack
