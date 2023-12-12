FROM ruby:3.2.2

ENV APP_ROOT="/myapp" \
    TZ=Asia/Tokyo

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

COPY Gemfile* ./

RUN bundle install -j4 && \
    bundle clean --force && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    rm -rf /var/cache/* /tmp/*

WORKDIR $APP_ROOT
COPY . ${APP_ROOT}/
