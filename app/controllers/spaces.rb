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

  get '/spaces/myspaces' do
    @spaces = current_user.spaces
    @user = User
    erb :'spaces/myspaces'
  end

  post '/approve' do
    booking = Booking.get(params[:booking_id])
    # p booking
    booking.update(status: 'Approved')
    redirect('/spaces/myspaces')
  end
end
