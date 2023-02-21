# Local environment for PHP developers built with Docker Compose

This stack consists of the following:

- PHP
- nginx
- mysql
- adminer
- Redis

To use the *PHP CS Fixer* in a container, run the command:

```sh
docker-compose run --rm php-fpm bash -c "php-cs-fixer fix /path/to/fix"
```
