class MakersBnb < Sinatra::Base

  get '/booked/confirm' do
    @space = Space.get(session[:space_id])
    erb :'booked/confirmed'
  end

  post '/booked' do
    session[:space_id] = params[:space_id]
    redirect '/booked/confirm'
  end

end
