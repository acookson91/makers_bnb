ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
# require 'sinatra/partial'
require 'rubygems'
require 'data_mapper'

require_relative 'models/data_mapper_setup'

require_relative 'server'

require_relative 'controllers/spaces'

class MakersBnb < Sinatra::Base

  # start the server if ruby file executed directly
  run! if app_file == $0
end
