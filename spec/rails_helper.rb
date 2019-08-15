# Require database cleaner at the top of the file.
require 'database_cleaner'

# [...]
# configure shoulda matchers

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# [...]
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
     with.test_framework :rspec
     with.library :rails
   end
  end

  # [...]
  # set up factory bot


  # set up database cleaner
  #start by truncating all the tables but then use the faster transaction strategy the rest of the time.
 config.before(:suite) do
   DatabaseCleaner.clean_with(:truncation)
   DatabaseCleaner.strategy = :transaction
 end

 # start the transaction strategy as examples are run
 config.around(:each) do |example|
   DatabaseCleaner.cleaning do
     example.run
   end
 end

 # [...]
end