
class MakersBnb < Sinatra::Base

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(email: params[:email], password: params[:password])
    if @user.save
      session['user_id'] = @user.id
      redirect '/spaces'
    else
      erb :'user/new'
    end
  end

end
