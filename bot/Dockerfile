FROM ruby:2.5.9-slim-buster

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential

ENV INSTALL_PATH /bot

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install

COPY . .

CMD rackup config.ru -o 0.0.0.0
