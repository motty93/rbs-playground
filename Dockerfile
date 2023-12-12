FROM ruby:3.2.2

ENV APP_ROOT="/myapp" \
    TZ=Asia/Tokyo \
    UID=1000 \
    GID=1000

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN groupadd -g ${GID} group && \
    useradd -u ${UID} -g ${GID} -m user && \
    id user && \
    echo "UID is: ${UID}" && \
    echo "GID is: ${GID}"

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

COPY Gemfile* ./

RUN bundle install -j4 && \
    bundle clean --force && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    rm -rf /var/cache/* /tmp/*

WORKDIR $APP_ROOT

RUN chown -R ${UID}:${GID} ${APP_ROOT}
COPY . ${APP_ROOT}/

USER ${UID}:${GID}
