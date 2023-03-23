ARG PHP_VER="7.4"
FROM php:$PHP_VER-fpm-alpine

ARG XHPROF=1
ARG XDEBUG=1
ARG REDIS_VER=5.3.2
ARG GD_PARAMS="--with-freetype=/usr --with-jpeg=/usr"
ARG PHP_MOD_INSTALL="mysqli pdo_mysql intl json curl soap exif zip sockets opcache gd"

RUN apk add --no-cache --virtual \
	.build-deps \
	$PHPIZE_DEPS

RUN if [ "$XHPROF" = "1" ]; then \
	pecl install xhprof && \
	docker-php-ext-enable xhprof; \
	fi

RUN if [ "$XDEBUG" = "1" ]; then \
        pecl install xdebug-3.1.4 && \
        docker-php-ext-enable xdebug && \
        mkdir /var/log/xdebug; \
	fi

RUN apk add --no-cache \
	git \
	bash \
	mysql-client \
	openssh-client \
	oniguruma \
	imagemagick6-dev \
	freetype-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	icu-dev \
	curl-dev \
	libxml2-dev \
	libzip-dev \
	libgomp \
	terminus-font \
	graphviz && \
	pecl install Imagick && \
	pecl install -o -f redis-"$REDIS_VER" && \
	docker-php-ext-enable imagick && \
	docker-php-ext-enable redis && \
	docker-php-ext-configure gd $GD_PARAMS && \
	docker-php-ext-install -j$(nproc) $PHP_MOD_INSTALL && \
	apk del .build-deps

# PHP-CS-Fixer
RUN curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o php-cs-fixer
RUN chmod a+x php-cs-fixer
RUN mv php-cs-fixer /usr/local/bin/php-cs-fixer

# PHP_CodeSniffer
RUN curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o phpcs
RUN curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar -o phpcbf
RUN chmod a+x phpcs phpcbf
RUN mv phpcs phpcbf /usr/local/bin/
