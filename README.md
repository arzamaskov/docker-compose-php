# Local environment for PHP developers built with Docker Compose

This stack consists of the following:

- PHP
- nginx
- MySQL
- Adminer
- Redis

To use the *PHP CS Fixer* in a container, run the command:

There are currently several different versions of PHP and MySQL. Use the appropriate versions as needed:

- PHP 7.1
- PHP 7.3

- MySQL 5.6
- MySQL 8

```sh
docker-compose run --rm php-fpm bash -c "php-cs-fixer fix /path/to/fix"
```
