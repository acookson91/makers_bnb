ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/partial'
require_relative 'server'
require_relative 'controllers/user'


class MakersBnb < Sinatra::Base

  run! if app_file == $0

end
