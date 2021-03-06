require 'rubygems'
require 'bundler'
require 'sinatra'
require 'haml'

Bundler.require(:test)

require 'capybara/cucumber'

require 'ruby-debug'

require 'app'

set :views, Proc.new { File.join(File.dirname(__FILE__), "/../../views") }

Capybara.app = Sinatra::Application.new
Capybara.default_driver = :selenium

require "selenium-webdriver"
Selenium::WebDriver.for :chrome

