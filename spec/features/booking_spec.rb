feature "Booking" do
  scenario "A user can book another user's space" do
    sign_up
    create_space_one
    sign_up(email: "b@b.com", password: "password")
    click_button "Request booking"
    space = Space.first
    user = User.last
    expect(user.bookings.first.user_id).to eq user.id
    # expect(space.available_date).to eq "BOOKED"
  end

  scenario "The status of a requested booking defaults to pending" do
    sign_up
    create_space_one
    sign_up(email: "b@b.com", password: "password")
    click_button "Request booking"
    space = Space.first
    user = User.last
    booking = Booking.last
    expect(booking.status).to eq "Pending"
  end

end
