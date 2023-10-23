FROM ruby:2.6.3
ARG build_without
ARG rails_env
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /paper_scammer_docker
WORKDIR /paper_scammer_docker
COPY Gemfile /paper_scammer_docker/Gemfile
COPY Gemfile.lock /paper_scammer_docker/Gemfile.lock
RUN bundle install
COPY . /paper_scammer_docker

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]