FROM ruby:2.6.5

# 必要なパッケージのインストール
RUN apt-get update -qq \
&& apt-get install -y nodejs build-essential libpq-dev \
&& apt-get install -y locales \
&& locale-gen ja_JP.UTF-8 \
&& echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

# yarnパッケージ管理ツールをインストール
RUN apt-get update \
&& apt-get install -y curl apt-transport-https wget \
&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update \
&& apt-get install -y yarn


RUN mkdir /report_app
WORKDIR /report_app


COPY Gemfile /report_app/Gemfile
COPY Gemfile.lock /report_app/Gemfile.lock
RUN bundle install
RUN bundle exec rails webpacker:install
COPY . /report_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
