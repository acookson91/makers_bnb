feature 'user can sign out' do
  scenario 'while being signed in' do
    sign_up
    click_button 'Log Out'
    expect(page).to have_button('Log In')
  end

  scenario 'sign out button is not displayed when not signed in' do
    visit '/'
    expect(page).not_to have_content('Log Out')
  end
end
