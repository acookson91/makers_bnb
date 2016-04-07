feature 'Approving requests as a host:' do
include Helpers
 scenario 'Space is removed from list of available spaces when approved' do
   sign_up
   create_space_one
   click_button 'Log Out'
   sign_up_again_and_again
  #  click_button 'View Space'
  #  click_button 'Request booking'
  request_booking
   click_button 'Log Out'
   click_link 'Log In'
   sign_in
   click_link 'My Requests'
   click_button 'Approve'
   visit '/spaces'
   expect(page).to_not have_content("Space Number One")
 end

 scenario 'Space appears in approved column when approved' do
   sign_up
   create_space_one
   click_button 'Log Out'
   sign_up_again_and_again
   request_booking
   click_button 'Log Out'
   click_link 'Log In'
   sign_in
   click_link 'My Requests'
   click_button 'Approve'
   visit '/spaces/myspaces'
   within 'a#approved-group' do
     expect(page).to have_content("Space Number One") end
   end



  scenario 'Host should be able to see requests' do
    sign_up
    create_space_one
    click_button 'Log Out'
    sign_up_again_and_again
    request_booking
    click_button 'Log Out'
    sign_up_again_and_again(email: 'b@b.com', password: 'password')
    request_booking
    click_button 'Log Out'
    click_link 'Log In'
    sign_in
    click_link 'My Requests'
    first('a#pending-group').click_button('Approve')
    within 'a#approved-group' do
    expect(page).to have_content "a@a.com requested this."
    end
    within 'a#pending-group' do
      expect(page).to have_content "b@b.com requested this."
    end
    expect(Booking.first.status).to eq "Approved"
  end

end
