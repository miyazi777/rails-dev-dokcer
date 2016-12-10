FROM ruby:2.3-alpine

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev" \
    RUBY_PACKAGES="ruby-json yaml nodejs" \
    BUNDLE_PATH="/project/vendor/bundle"

RUN apk update && \
    apk upgrade && \
    apk add --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /usr/src/app && \
    gem install nokogiri -v '1.6.8'

WORKDIR /project
ADD Gemfile /project/
ADD Gemfile.lock /project/
EXPOSE 3000

RUN bundle install && \
    bundle clean

