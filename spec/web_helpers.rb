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
    space = Space.new(name: "Space Number One", desc: "Lovely", price: "10")
    arr = ["10-4-16","11-4-16","12-4-16","13-4-16","14-4-16","15-4-16"]
    arr.each { |date|
      the_date = Available.first_or_create(single_date: date)
      space.availables << the_date
      the_date.spaces << space
      the_date.save!
    }
    space.save!
    user = User.first
    user.spaces << space
    user.save!
    visit '/spaces'
  end

  def create_space_two
    space = Space.new(name: "Space Number Two", desc: "Awful", price: "10")
    arr = ["12-4-16","13-4-16","14-4-16","15-4-16"]
    arr.each { |date|
      the_date = Available.first_or_create(single_date: date)
      space.availables << the_date
      the_date.spaces << space
      the_date.save!
    }
    space.save!
    user = User.first
    user.spaces << space
    user.save!
    visit '/spaces'
  end

  def request_booking
    click_button "View Space"
    fill_in :chosen_date, with: "12-4-16"
    click_button "Request booking"
  end


end
