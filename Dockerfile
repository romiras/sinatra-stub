FROM ruby:2.5.5-alpine3.9

# Install gems
ENV APP_DIR /app
ENV HOME /root
RUN mkdir $APP_DIR
WORKDIR $APP_DIR
COPY Gemfile* $APP_DIR/

RUN apk add --update \
    build-base \
    && bundle install --jobs 10 --retry 3 --without test \
    && rm -rf /var/cache/apk/*

# Upload source
COPY . $APP_DIR

# Start server
ENV RACK_ENV production
ENV PORT 3000
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
