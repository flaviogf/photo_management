FROM ruby:3.0

LABEL maintainer=flavio.fernandes6@gmail.com

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    nodejs \
    npm && npm install --global yarn

WORKDIR /usr/local/app

COPY Gemfile* ./

RUN bundle install

COPY . ./

CMD [ "bin/rails", "s", "-b", "0.0.0.0" ]
