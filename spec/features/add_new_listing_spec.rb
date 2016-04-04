feature 'Add new listings' do
  scenario 'page should allow new listings to be created' do
    visit '/spaces/new'
    fill_in :name, with: "Space Number One"
    click_button "Add new space"
    expect(page).to have_content "Space Number One"
  end
end
