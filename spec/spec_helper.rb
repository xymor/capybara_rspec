require 'rubygems'
require 'bundler/setup'

require 'capybara'
require 'capybara/dsl'
require 'rspec/core'
require 'capybara/rspec/matchers'
require 'capybara/rspec/features'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.google.com'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

  config.after do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

#prevents webdriver from closing the browser or navigating to about:blank upen finishing
Capybara::Selenium::Driver.class_eval do
  def quit
    puts "Press RETURN to quit the browser"
    $stdin.gets
    @browser.quit
    rescue Errno::ECONNREFUSED
  end
  def reset!
  end
end
