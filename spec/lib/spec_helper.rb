require 'capybara'
require 'capybara/rspec'
require 'site_prism'
require 'lib/app_initialiser'

spec_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(spec_dir)

RSpec.configure do |config|
    Capybara.ignore_hidden_elements = false
 
  Capybara.configure do |capybara|
    capybara.run_server = false
    capybara.app_host = "http://link.springer.com"
    capybara.default_driver = :selenium
  end

  config.include Capybara::DSL
end
