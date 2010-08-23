require 'rubygems'
require 'bundler'

Bundler.setup

require 'sinatra'
require 'rack'
require 'haml'

$LOAD_PATH << 'lib'

require 'gol'

set :run, false

configure :development do |c|
  require 'ruby-debug'
  require 'sinatra/reloader'
  # c.also_reload "*.rb"
end

require 'app'

run Sinatra::Application