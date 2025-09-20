#!/usr/bin/env bash

set -o errexit

bundle config set force_ruby_platform true
bundle install
bin/rails assets:precompile
bin/rails assets:clean
# Force Ruby platform if needed
bundle config set force_ruby_platform true

bin/rails db:migrate
bin/rails db:seed