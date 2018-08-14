#!/bin/bash
echo "Preparing application..."
rm -rf tmp/pids/server.pid
rm -rf log/development.sphinx.pid
sudo bundle install
RAILS_ENV=development bundle exec rake dev:bootstrap
RAILS_ENV=development bundle exec rake assets:precompile
RAILS_ENV=development bundle exec rake dev:development_testdata:create
foreman start -p 3000
