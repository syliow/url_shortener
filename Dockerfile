# Use an official Ruby image as the base image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock files to the container
COPY Gemfile Gemfile.lock ./

# Install the gems specified in the Gemfile
RUN bundle install

# Copy the rest of the application code to the container
COPY . .

# Precompile assets if necessary
RUN bundle exec rake assets:precompile

# Expose the port your app runs on
EXPOSE 3000

# Specify the command to run your application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]