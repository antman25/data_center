CREATE USER atlbitbucket;
CREATE DATABASE bitbucket;
GRANT ALL PRIVILEGES ON DATABASE bitbucket TO atlbitbucket;
ALTER USER atlbitbucket PASSWORD 'password';
