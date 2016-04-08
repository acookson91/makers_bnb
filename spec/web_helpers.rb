module Helpers
  def sign_up(email: "p@p.com", password: "password")
    visit 'user/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Sign Up"
  end

  def sign_in(email: "p@p.com", password: "password")
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Sign In"
  end

  def sign_up_again_and_again(email: 'a@a.com', password: 'password')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Sign Up"
  end

  def create_space_one
    visit '/spaces/new'
    fill_in :name, with: "Space Number One"
    fill_in :desc, with: "Lovely"
    fill_in :price, with: "10"
    fill_in :date1, with: "10-4-16"
    fill_in :date2, with: "15-4-16"
    using_wait_time 10 do
      click_button "Add new space"
    end
  end

  def create_space_two
    visit '/spaces/new'
    fill_in :name, with: "Space Number Two"
    fill_in :desc, with: "Awful"
    fill_in :price, with: "1"
    fill_in :date1, with: "12-4-16"
    fill_in :date2, with: "17-4-16"
    click_button "Add new space"
  end

  def request_booking
    click_button "View Space"
    click_button "Request booking"
  end


end
