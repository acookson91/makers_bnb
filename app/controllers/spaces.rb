class MakersBnb < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    user = current_user
    space = Space.new(name: params[:name], desc: params[:desc], price: params[:price])
    params[:available_date].each {|x|
      the_date = Available.first_or_create(single_date: x)
      space.availables << the_date
      the_date.spaces << space
      the_date.save!
    }
    space.save!
    user.spaces << space
    user.save!
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  post '/space' do
    session[:space_id] = params[:space_id]
    redirect('/space')
  end

  get '/space' do
    @space = Space.get(session[:space_id])
    erb :'spaces/space'
  end

  get '/spaces/myspaces' do
    @spaces = current_user.spaces
    @user = User
    @bookings = current_user.bookings
    erb :'spaces/myspaces'
  end

  post '/approve' do
    booking = Booking.get(params[:booking_id])
    chosen_date = booking.booking_date
    space = Space.get(params[:space_id])
    space.available_spaces.get(space.id, Available.first(single_date:chosen_date).id).destroy
    booking.update(status: 'Approved')
    redirect('/spaces/myspaces')
  end

  post '/decline' do
    booking = Booking.get(params[:booking_id])
    booking.update(status: 'Declined')
    redirect('/spaces/myspaces')
  end

  get '/spacedates' do
    headers 'Access-Control-Allow-Origin' => '*'
    arr = []
    Space.get(session[:space_id]).availables.each {|date|
      arr << date.single_date
    }
    arr.to_json
  end
end
