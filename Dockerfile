FROM ruby:3.2.2

ARG UID
ARG GID

ENV APP_ROOT="/myapp" \
    BUNDLE_ROOT="/usr/local/bundle" \
    TZ=Asia/Tokyo \
    UID=${UID} \
    GID=${GID}

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN groupadd -g ${GID} group && \
    useradd -u ${UID} -g ${GID} -m user

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
RUN chown -R ${UID}:${GID} ${BUNDLE_ROOT}
COPY . ${APP_ROOT}/

USER ${UID}:${GID}
