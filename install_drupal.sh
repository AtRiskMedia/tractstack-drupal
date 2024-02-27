#!/bin/bash

NAME=oak
DB_NAME=oak
DB_USER=demo
DB_PASSWORD=demo
ACCOUNT_PASSWORD=demo

composer create-project drupal/recommended-project "$NAME"
cd "$NAME"
cp -r ~/src/tractstack-drupal/profiles/ web/profiles
composer require --dev drush/drush
composer require drupal/jsonapi_extras
composer require drupal/simple_oauth

./vendor/bin/drush site-install tractstack --db-url=mysql://"$DB_USER":"$DB_PASSWORD"@localhost/"$DB_NAME" --site-name=TractStack-"$NAME" --account-name=admin --account-pass="$ACCOUNT_PASSWORD" -y
