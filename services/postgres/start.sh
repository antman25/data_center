docker run -d \
    --name gitlab-postgres \
    -e POSTGRES_PASSWORD=password \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /mnt/scratch/volumes/gitlab-postgres:/var/lib/postgresql/data \
    -p 15432:5432 \
    postgres
