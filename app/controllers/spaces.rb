class MakersBnb < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    user = @current_user ||= User.get(session['user_id'])
    space = Space.new(name: params[:name], desc: params[:desc], price: params[:price], available_date: Time.now)
    user.spaces << space
    space.save
    user.save
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end
end
