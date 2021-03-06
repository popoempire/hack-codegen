#!/bin/sh
set -ex
hhvm --version

composer install

hh_client

hhvm vendor/bin/phpunit test/

echo > .hhconfig
rm -rf vendor/hhvm/hhast # avoid circular dependency when fixing things
hh_server --check $(pwd)
