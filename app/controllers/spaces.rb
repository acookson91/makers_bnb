class MakersBnb < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    user = current_user
    space = Space.new(name: params[:name], desc: params[:desc], price: params[:price], available_date: params[:available_date])
    user.spaces << space
    space.save
    user.save
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/myspaces' do
    @spaces = current_user.spaces
    erb :'spaces/myspaces'
  end

  post '/approve' do
    space = Space.get(session[:space_id])
    space.bookings.update(status: 'Approved')
    redirect('/spaces/myspaces')
  end
end
