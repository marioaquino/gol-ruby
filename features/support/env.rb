RACK_ENV = 'test' unless defined?(RACK_ENV)

cuk_dir_name = File.dirname(__FILE__)
lib_path = File.join(cuk_dir_name, "/../../lib")
config_path = File.join(cuk_dir_name, "/../../")

[lib_path, config_path].each {|path| 
  $LOAD_PATH << path unless $LOAD_PATH.include?(path)
}


require 'gol'
require 'rubygems'
require 'bundler'

Bundler.require(:test)

require 'sinatra'
require 'haml'

require 'app'
Sinatra::Application.app_file = 'app'

require 'capybara/cucumber'
Capybara.app = Sinatra::Application.new
Capybara.javascript_driver = :envjs

require 'ruby-debug'
