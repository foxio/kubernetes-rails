FROM foxio/rails

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm nodejs-legacy
RUN mkdir /my_project
WORKDIR /my_project

ADD Gemfile /my_project/Gemfile
ADD Gemfile.lock /my_project/Gemfile.lock
RUN bundle install
ADD . /my_project

RUN rake bower:install

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/tmp"]

RUN chmod +x /my_project/init.sh
RUN chmod +x /my_project/kubernetes-post-start.sh

CMD ["sh", "/my_project/init.sh"]

ENTRYPOINT bundle exec unicorn -c config/unicorn.rb
