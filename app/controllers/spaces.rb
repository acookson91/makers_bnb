class MakersBnb < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end
end
