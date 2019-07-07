FROM ruby:2.4.2

# ENV GEM_HOME="/usr/local/bundle"
# ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN mkdir /app
WORKDIR /app
RUN gem list bundler
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler -v 2.0.1
RUN bundler -v
ADD Gemfile Gemfile.lock /app/
RUN bundle install -j 8

ADD . /app

CMD ["rails", "server", "-b", "0.0.0.0"]