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
    #p "Space before booking: #{space.user}"
    space.update(available_date: "BOOKED")
    #p "Space after booking: #{space}"
    user.bookings << booking
    space.bookings << booking
    #p booking
    booking.save
    user.save
    #p user
    #p booking
    redirect '/booked/confirm'
  end

end
