require 'cucumber/rails'
require 'capybara/cucumber'
require 'database_cleaner/active_record'

# Capybara defaults to CSS3 selectors rather than XPath.
Capybara.default_selector = :css

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
ActionController::Base.allow_rescue = false

# DatabaseCleaner configuration
DatabaseCleaner.strategy = :transaction

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end

# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
Cucumber::Rails::Database.javascript_strategy = :truncation
