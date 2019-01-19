FROM ruby:2.6.0-slim-stretch

ENV RAILS_ROOT /var/www/qafg_web
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile
RUN apt update
RUN set -ex && \
	savedAptMark="$(apt-mark showmanual)" && \
	apt-get install -y build-essential libpq-dev nodejs && \
	echo "gem: --no-document" >> ~/.gemrc && \
	bundle install --jobs 20 --retry 5 && \
	apt-mark showmanual | xargs apt-mark auto > /dev/null && \
	apt-mark manual $savedAptMark && \
	apt-get purge -y --auto-remove && \
	apt install -y --no-install-recommends libpq5 nodejs
	
#RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 
# Set an environment variable where the Rails app is installed to inside of Docker image
#ENV RAILS_ROOT /var/www/qafg_web
#RUN mkdir -p $RAILS_ROOT 
# Set working directory
#WORKDIR $RAILS_ROOT
# Setting env up
#ENV RAILS_ENV='production'
#ENV RACK_ENV='production' 
# Adding gems
#COPY Gemfile Gemfile
#COPY Gemfile.lock Gemfile.lock
#RUN bundle install --jobs 20 --retry 5 
#--without development test 
# Adding project files
COPY . .
#RUN bundle exec rake assets:precompile
#EXPOSE 3000
#CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
#Temporary to keep container running
CMD tail -f /dev/null

