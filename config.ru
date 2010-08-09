require 'rubygems'
require 'bundler'

Bundler.setup

require 'sinatra'
require 'rack'
require 'haml'

set :run, false

configure :development do |c|
  require 'sinatra/reloader'
  # c.also_reload "*.rb"
end

require 'app'

run Sinatra::Application