FROM ruby:3.1-bullseye
LABEL maintainer="BigWestGang<big.west.e.x.troopers@gmail.com>"

ARG RUBYGEMS_VERSION=3.3.20

RUN mkdir /app

WORKDIR /app

COPY ./backend/Gemfile /app/Gemfile
COPY ./backend/Gemfile.lock /app/Gemfile.lock

RUN gem update --system ${RUBYGEMS_VERSION} && subundle install

COPY ./backend /app

COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]
