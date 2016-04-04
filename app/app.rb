require 'sinatra/base'

class MakersBnb < Sinatra::Base

  get '/user/new' do
    erb :'user/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
