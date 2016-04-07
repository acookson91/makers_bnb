feature 'Add new listings' do
  scenario 'page should allow new listings to be created' do
    sign_up
    visit '/spaces/new'
    expect(page).to have_field "name"
    expect(page).to have_field "desc"
    expect(page).to have_field "price"
  end

  scenario 'page should allow new listings to be created' do
    sign_up
    visit '/spaces/new'
    create_space_one
    expect(page).to have_content "Space Number One"
    expect(page).to have_content "Lovely"
    expect(page).to have_content '10'
  end

  scenario 'user can have multiple spaces' do
    sign_up
    create_space_one
    create_space_two
    expect(page).to have_content "Space Number One"
    expect(page).to have_content "Space Number Two"
    expect(User.first.spaces.length).to eq 2
  end

  scenario 'user can book a space' do
    sign_up
    create_space_one
    sign_up(email: "a@a.com", password: '1234')
    click_button "View Space"
    expect(page).to have_button "Request booking"
    click_button "Request booking"
    expect(page).to have_content "Your request to book Space Number One is pending."
  end
end
