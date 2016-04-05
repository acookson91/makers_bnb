feature 'Add new listings' do
  scenario 'page should allow new listings to be created' do
    visit 'user/new'
    fill_in :email, with: "p@p.com"
    fill_in :password, with: "password"
    click_button "Sign up"
    visit '/spaces/new'
    fill_in :name, with: "Space Number One"
    click_button "Add new space"
    expect(page).to have_content "Space Number One"
  end

  scenario 'user can have multiple spaces' do
    visit 'user/new'
    fill_in :email, with: "p@p.com"
    fill_in :password, with: "password"
    click_button "Sign up"
    visit 'spaces/new'
    fill_in :name, with: "Space Number One"
    click_button "Add new space"
    visit 'spaces/new'
    fill_in :name, with: "Space Number Two"
    click_button "Add new space"
    user = User.first
    expect(page).to have_content "Space Number One"
    expect(page).to have_content "Space Number Two"
    expect(user.spaces.length).to eq 2
  end
end
