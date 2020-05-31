FROM ruby:2.7.0
WORKDIR /opt/app
SHELL ["/bin/bash", "-c"]

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y libpq-dev libxml2-dev libxslt1-dev

# Gems installing
RUN gem install rails bundler
COPY Gemfile* ./
RUN bundle install

# Instaling npm 
#Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y make nodejs \
    && npm i -g yarn

COPY package.json package.json
RUN npm i

COPY . .

EXPOSE 3000