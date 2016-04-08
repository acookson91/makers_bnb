class MakersBnb < Sinatra::Base

  get '/booked/confirm' do
    @space = Space.get(session[:space_id])
    erb :'booked/confirmed'
  end


  post '/booked' do
    session[:space_id] = params[:space_id]
    session[:chosen_date] = params[:chosen_date]
    space = Space.get(session[:space_id])
    user = current_user
    booking = Booking.new(booking_date: session[:chosen_date])
    user.bookings << booking
    space.bookings << booking
    booking.save!
    user.save!
    redirect '/booked/confirm'
  end

end
