require 'sinatra/base'

class makers_bnb < Sinatra::Base
  get '/' do
    'Hello makers_bnb!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
