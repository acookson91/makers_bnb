feature "User sign In:" do
  include Helpers
  scenario "A sign in page exists" do
    sign_up
    click_button "Log Out"
    click_link "Log In"
    within 'form#signinform' do
      expect(page).to have_field "email"
      expect(page).to have_field "password"
    end
  end

  scenario "A user can sign in" do
    sign_up
    click_button "Log Out"
    click_link "Log In"
    sign_in
    expect(page.current_path).to eq '/spaces'
  end

  scenario "A user can't sign in with bad details" do
    sign_up
    click_button "Log Out"
    click_link "Log In"
    sign_in(email: "a@a.com", password: "pass")
    expect(page.current_path).to eq '/user/signin'
  end
end
