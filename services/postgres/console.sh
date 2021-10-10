#!/bin/bash
docker run -it postgres:latest psql -h 10.0.0.222 -p 15432 -U postgres
