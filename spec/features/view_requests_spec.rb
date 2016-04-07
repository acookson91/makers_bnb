feature 'View requests' do
  scenario 'Host should be able to see requests' do
   sign_up
   create_space_one
   click_button "Log Out"
   fill_in :email, with: 'a@a.com'
   fill_in :password, with: 'password'
   click_button "Sign Up"
   click_button 'View Space'
   click_button 'Request booking'
   click_button 'Log Out'
   click_link 'Log In'
   sign_in
   click_link 'My Requests'
   expect(page).to have_content('My Requests')
   expect(page.current_path).to eq("/spaces/myspaces")
 end

 scenario 'Host should see pending requests' do
   sign_up
   create_space_one
   click_button "Log Out"
   fill_in :email, with: 'a@a.com'
   fill_in :password, with: 'password'
   click_button "Sign Up"
   click_button 'View Space'
   click_button 'Request booking'
   click_button 'Log Out'
   click_link 'Log In'
   sign_in
   click_link 'My Requests'
   within 'a#pending-group' do
     expect(page).to have_content("Space Number One")
   end
 end

end
