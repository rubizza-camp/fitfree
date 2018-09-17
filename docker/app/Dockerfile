# todo: +-git cloning

FROM rubyroidlabs/ruby:2-5-1-node-stretch

ARG BRANCH
ARG REPOSITORY
ARG PROJECT_NAME

LABEL maintainer="Aleksei Lazarenko <Lazarenko1294@yandex.ru>"

ENV RAILS_ROOT /var/www/fitfree
RUN mkdir -p $RAILS_ROOT

# Set working directory
WORKDIR $RAILS_ROOT

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

# Adding project files
COPY . .

#RUN rails assets:precompile

EXPOSE 3000

CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]
