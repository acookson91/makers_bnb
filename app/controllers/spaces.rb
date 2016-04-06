class MakersBnb < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    user = current_user
    space = Space.new(name: params[:name], desc: params[:desc], price: params[:price], available_date: params[:available_date])
    # p Space.all
    user.spaces << space
    p user.spaces
    space.save
    user.save
    redirect '/spaces'
  end

  get '/spaces' do
    # p Space.all
    @spaces = Space.all
    # p @spaces
    erb :'spaces/index'
  end
end
