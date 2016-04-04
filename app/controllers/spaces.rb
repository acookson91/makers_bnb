class MakersBnb < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end
end
