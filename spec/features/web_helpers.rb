def sign_up(email: "p@p.com", password: "password")
  visit 'user/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button "Sign Up"
end

def create_space_one
  visit '/spaces/new'
  fill_in :name, with: "Space Number One"
  fill_in :desc, with: "Lovely"
  fill_in :price, with: "10"
  fill_in :available_date, with: "10/04/16"
  click_button "Add new space"
end

def create_space_two
  visit '/spaces/new'
  fill_in :name, with: "Space Number Two"
  fill_in :desc, with: "Awful"
  fill_in :price, with: "1"
  click_button "Add new space"
end
