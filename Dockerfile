FROM ruby:2.7.1

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get -qq -y update \
&& apt-get -qq -y --no-install-recommends install \
    nodejs yarn libpq-dev postgresql-client \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install -j3
COPY package.json yarn.lock /app/
RUN yarn install
COPY . /app
RUN ln -sf /dev/stdout /app/log/development.log
RUN chmod +x /app/docker/script/start_script.sh
ENTRYPOINT ["/app/docker/script/start_script.sh"]
EXPOSE 3000
