feature "Declining requests as a host:" do
  include Helpers

  scenario "Space listing persists in /spaces when pending request is declined" do
    sign_up
    create_space_one
    click_button 'Log Out'
    sign_up_again_and_again
   request_booking
    click_button 'Log Out'
    click_link 'Log In'
    sign_in
    click_link 'My Requests'
    click_button 'Decline'
    visit '/spaces'
    expect(page).to have_content("Space Number One")
  end

  scenario "Space appears in declined column when declined" do
    sign_up
    create_space_one
    click_button 'Log Out'
    sign_up_again_and_again
    request_booking
    click_button 'Log Out'
    click_link 'Log In'
    sign_in
    click_link 'My Requests'
    click_button 'Decline'
    visit '/spaces/myspaces'
    within 'a#declined-group' do
      expect(page).to have_content("Space Number One")
      expect(page).to have_content "a@a.com requested this and you declined."
    end
    # within 'a#pending-group' do
    # expect(page).to be_empty
    # # expect(page).to_not have_content "a@a.com requested this."
    # end
  end

  scenario "Space appears in declined column when declined 2" do
    sign_up
    create_space_one
    click_button 'Log Out'
    sign_up_again_and_again
    request_booking
    click_button 'Log Out'
    click_link 'Log In'
    sign_in
    click_link 'My Requests'
    click_button 'Decline'
    visit '/spaces/myspaces'
    # within 'a#declined-group' do
    #   expect(page).to have_content("Space Number One")
    #   expect(page).to have_content "a@a.com requested this and you declined."
    # end
    within 'a#pending-group' do
    expect(page).to_not have_content("Space Number One")
    expect(page).to_not have_content "a@a.com requested this."
    end
  end

end
