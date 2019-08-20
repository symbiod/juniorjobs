#!/usr/bin/env bash

cd /app
gem install bundler
bundle install
cp config/database.yml.sample config/database.yml
rake db:create && rake db:schema:load
