class MakersBnb < Sinatra::Base

  get '/booked/confirm' do
    @space = Space.get(session[:space_id])
    erb :'booked/confirmed'
  end

  post '/booked' do
    session[:space_id] = params[:space_id]
    space = Space.get(session[:space_id])
    user = current_user
    booking = Booking.new(booking_date: space.available_date)
    # booking.update(available_date: "BOOKED")
    user.bookings << booking
    space.bookings << booking
    booking.save!
    user.save!
    redirect '/booked/confirm'
  end

end
