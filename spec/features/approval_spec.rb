feature 'View requests' do

 scenario 'Space is removed from list when approved 2' do
   visit 'user/new'
   fill_in :email, with: 'p@p.com'
   fill_in :password, with: 'password'
   click_button "Sign Up"
   visit '/spaces/new'
   fill_in :name, with: "Space Number One"
   fill_in :desc, with: "Lovely"
   fill_in :price, with: "10"
   fill_in :available_date, with: "10/04/16"
   click_button "Add new space"
   click_button 'Log Out'
   fill_in :email, with: 'a@a.com'
   fill_in :password, with: 'password'
   click_button "Sign Up"
   click_button 'View Space'
   click_button 'Request booking'
   click_button 'Log Out'
   click_link 'Log In'
   fill_in :email, with: 'p@p.com'
   fill_in :password, with: 'password'
   click_button 'Sign In'
   click_link 'My Requests'
   click_button 'Approve'
   visit '/spaces'
   expect(page).to_not have_content("Space Number One")
 end



  scenario 'Host should be able to see requests 2' do
    visit 'user/new'
    fill_in :email, with: 'p@p.com'
    fill_in :password, with: 'password'
    click_button "Sign Up"
    visit '/spaces/new'
    fill_in :name, with: "Space Number One"
    fill_in :desc, with: "Lovely"
    fill_in :price, with: "10"
    fill_in :available_date, with: "10/04/16"
    click_button "Add new space"
    click_button 'Log Out'
    fill_in :email, with: 'a@a.com'
    fill_in :password, with: 'password'
    click_button "Sign Up"
    click_button 'View Space'
    click_button 'Request booking'
    click_button 'Log Out'
    click_link 'Log In'
    fill_in :email, with: 'p@p.com'
    fill_in :password, with: 'password'
    click_button 'Sign In'
    click_link 'My Requests'
    click_button 'Approve'
    within 'a#approved-group' do
    expect(page).to have_content "Space Number One"
    end
    expect(Booking.first.status).to eq "Approved"
  end

end
