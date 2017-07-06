FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /docker-rails
WORKDIR /docker-rails
ADD Gemfile /docker-rails/Gemfile
ADD Gemfile.lock /docker-rails/Gemfile.lock
RUN bundle install
ADD . /docker-rails