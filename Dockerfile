FROM ruby:3.1-bullseye
LABEL maintainer="BigWestGang<big.west.e.x.troopers@gmail.com>"

RUN apt-get update -qq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_18.x | bash \
    && apt-get install nodejs -yq \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g yarn

ARG RUBYGEMS_VERSION=3.3.20

RUN mkdir /app

WORKDIR /app

COPY ./backend/Gemfile /app/Gemfile
COPY ./backend/Gemfile.lock /app/Gemfile.lock

RUN gem update --system ${RUBYGEMS_VERSION} && bundle install

COPY ./backend /app

COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]
