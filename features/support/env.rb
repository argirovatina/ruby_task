require 'capybara'
require 'capybara/dsl'
require 'capybara/helpers'
require 'cucumber'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'rspec'
require 'chromedriver/helper'
require 'capybara-screenshot/cucumber'
require 'tiny_tds'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_selector = :css
  config.default_max_wait_time = 2
  config.match = :smart
end

World(Capybara)

Capybara::Screenshot.autosave_on_failure = false
Capybara.save_path = "#{Dir.pwd}/screenshots"