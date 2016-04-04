ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'rubygems'
require 'data_mapper'
require_relative 'models/data_mapper_setup'
require_relative 'server'
require_relative 'controllers/spaces'
require_relative 'controllers/user'

class MakersBnb < Sinatra::Base

  run! if app_file == $0

end
