feature 'View requests' do
  scenario 'Host should be able to see requests' do
   sign_up
   create_space_one
   click_button "Log Out"
   fill_in :email, with: 'a@a.com'
   fill_in :password, with: 'password'
   click_button "Sign Up"
   click_button "Request booking"
   click_button 'Log Out'
   click_link 'Log In'
   sign_in
   click_link 'My Requests'
   click_button 'Approve'
   within 'a#approved-group' do
     expect(page).to have_content "Space Number One"
   end
   expect(Booking.first.status).to eq "Approved"
 end

 scenario 'Space is removed from list when approved' do
   sign_up
   create_space_one
   click_button "Log Out"
   fill_in :email, with: 'a@a.com'
   fill_in :password, with: 'password'
   click_button "Sign Up"
   click_button "Request booking"
   click_button 'Log Out'
   click_link 'Log In'
   sign_in
   click_link 'My Requests'
   click_button 'Approve'
   visit '/spaces'
   expect(page).to_not have_content("Space Number One")
 end


end