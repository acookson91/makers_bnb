feature 'User management' do
  include Helpers

  scenario 'user signs up' do
    sign_up
    expect(User.count).to eq(1)
    expect(User.first.email).to eq("p@p.com")
  end

  scenario "user can't sign up without email" do
    expect do
      visit '/user/new'
      fill_in :password, with: 'ghost'
      click_button 'Sign Up'
    end.not_to change(User, :count)
  end

  scenario 'user can\'t sign up without password' do
    expect do
      visit '/user/new'
      fill_in :email, with: 'jon.snow@nightswatch.com'
      click_button 'Sign Up'
    end.not_to change(User, :count)
  end

  scenario 'user can\'t sign up invaild email' do
    visit '/user/new'
    expect do
      fill_in :email, with: 'jon.snownightswatch.com'
      fill_in :password, with: 'ghost'
      click_button 'Sign Up'
    end.not_to change(User, :count)
  end

  scenario 'user sign up twice' do
    sign_up
    expect do
      sign_up
    end.not_to change(User, :count)
  end
end
