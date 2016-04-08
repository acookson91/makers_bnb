
class MakersBnb < Sinatra::Base

  get '/' do
    redirect '/user/new'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      session["user_id"] = @user.id
      redirect '/spaces'
    else
      erb :'user/new'
    end
  end

  post '/sessions' do
    session['user_id'] = nil
    redirect '/user/signin'
  end

  get '/user/signin' do
    erb :'user/signin'
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      redirect '/user/signin'
    end
  end

end
