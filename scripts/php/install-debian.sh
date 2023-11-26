#!/bin/sh

# The PHP Version
V=8.2

# Taken from the ondrej's debian repo

# To add this repository please do:

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

${SUDO} apt-get update
${SUDO} apt-get -y install lsb-release ca-certificates curl
${SUDO} curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
${SUDO} sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
${SUDO} apt-get update
${SUDO} apt-get install php${V}-cli php${V}-fpm php${V}-sqlite3 php${V}-xml php${V}-zip zip unzip curl php${V}-curl
