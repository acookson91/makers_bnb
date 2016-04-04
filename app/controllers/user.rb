class MakersBnb < Sinatra::Base

  get '/user/new' do
    erb :'user/new'
  end


  post '/user' do
    user = User.create()
  end
end
