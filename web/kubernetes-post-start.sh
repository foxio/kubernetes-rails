#!/bin/bash

RAILS_ENV=$RAILS_ENV bundle exec rake db:create
RAILS_ENV=$RAILS_ENV bundle exec rake db:migrate
cp -a /my_project/public/. /assets
