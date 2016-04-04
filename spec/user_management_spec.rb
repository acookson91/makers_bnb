feature 'User management' do

  scenario 'user signs up' do
    visit '/user/new'
    fill_in :email, with: 'jon.snow@nightswatch.com'
    fill_in :password, with: 'ghost'
    click_button 'Sign up'
    expect(User.count).to eq(1)
    expect(User.first.email).to eq('jon.snow@nightswatch.com')
  end

  scenario 'user can\'t sign up without email' do
    expect do
      visit '/user/new'
      fill_in :password, with: 'ghost'
      click_button 'Sign up'
    end.not_to change(User, :count)
  end

  scenario 'user can\'t sign up without password' do
    expect do
      visit '/user/new'
      fill_in :email, with: 'jon.snow@nightswatch.com'
      click_button 'Sign up'
    end.not_to change(User, :count)
  end

  scenario 'user can\'t sign up invaild email' do
    visit '/user/new'
    expect do
      fill_in :email, with: 'jon.snownightswatch.com'
      fill_in :password, with: 'ghost'
      click_button 'Sign up'
    end.not_to change(User, :count)
  end

  scenario 'user sign up twice' do
    visit '/user/new'
    fill_in :email, with: 'jon.snow@nightswatch.com'
    fill_in :password, with: 'ghost'
    click_button 'Sign up'
    visit '/user/new'
    expect do
      fill_in :email, with: 'jon.snow@nightswatch.com'
      fill_in :password, with: 'ghost'
      click_button 'Sign up'
    end.not_to change(User, :count)
  end



end
