FROM ruby:2.6

LABEL maintainer="legacy370@gmail.com"

RUN apt-get update -yqq && \
  apt-get install -yqq --no-install-recommends \
  nodejs \
  vim

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

ENV BUNDLE_PATH /gems

RUN bundle install

COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
