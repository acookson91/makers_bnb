feature 'User management' do

  scenario 'user signs up' do
    visit '/user/new'
    fill_in :email, with: 'jon.snow@nightswatch.com'
    fill_in :password, with: 'ghost'
    click_button 'Sign up'
    expect(User.count).to eq(1)
    expect(User.first.email).to eq('jon.snow@nightswatch.com')
  end


end
