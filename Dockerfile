FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists

RUN curl -o- -L https://yarnpkg.com/install.sh | bash

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

LABEL maintainer="Aleksei Lazarenko <Lazarenko1294@yandex.ru>"