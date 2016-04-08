feature 'Viewing requests:' do
  include Helpers
  scenario 'Host should be able to see requests' do
   sign_up
   create_space_one
   click_button "Log Out"
   sign_up_again_and_again
   request_booking
   click_button 'Log Out'
   click_link 'Log In'
   sign_in
   click_link 'My Requests'
   expect(page).to have_content('My Requests')
   expect(page.current_path).to eq("/spaces/myspaces")
 end

 scenario 'Host should see pending requests made on their space' do
   sign_up
   create_space_one
   click_button "Log Out"
   sign_up_again_and_again
   request_booking
   click_button 'Log Out'
   click_link 'Log In'
   sign_in
   click_link 'My Requests'
   within 'a#pending-group' do
     expect(page).to have_content("Space Number One")
   end
 end
end
