RACK_ENV = 'test' unless defined?(RACK_ENV)

cuk_dir_name = File.dirname(__FILE__)
lib_path = File.join(cuk_dir_name, "/../../lib")
config_path = File.join(cuk_dir_name, "/../../")

[lib_path, config_path].each {|path| 
  $LOAD_PATH << path unless $LOAD_PATH.include?(path)
}


require 'gol'
require 'rubygems'
# The below are explicitly required because loading Bundler instead adds
# 3 seconds to the load time.  EPIC FAIL!
require 'webrat'
require 'rack/test'
require 'sinatra'
require 'haml'
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