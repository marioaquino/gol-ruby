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
require 'sinatra'
require 'haml'

Bundler.require(:test)

require 'app'

Sinatra::Application.app_file = 'app'

Webrat.configure do |config|
  config.mode = :rack
end

class MyWorld
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body
  
  def app
    Sinatra::Application.tap {|app| app.set :environment, :test }
  end

end

World{MyWorld.new}