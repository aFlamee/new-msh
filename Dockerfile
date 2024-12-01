FROM ruby:3

RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev vim
RUN apt-get update -qq && apt-get install -y \

  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  wget \
  unzip \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libappindicator3-1 \
  fonts-liberation \
  libasound2 \
  xdg-utils \
  curl \
  ca-certificates \
  libvulkan1 \
  libgbm-dev \
  libx11-xcb1 \
  libgtk-3-0 \
  libnotify4 \
  libnss3-dev \
  libxcomposite1 \
  libxrandr2 \
  libxfixes3 \
  libxtst6
ENV EDITOR vim

RUN mkdir /app
WORKDIR /app

RUN gem update --system

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle update --bundler
RUN bundle install

CMD bash
