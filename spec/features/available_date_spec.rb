# feature "Available Dates" do
#   scenario "Creates an available date" do
#     sign_up
#     visit "/spaces/new"
#     fill_in :name, with: "Space Number One"
#     fill_in :desc, with: "Wicked"
#     fill_in :price, with: "10"
#     click_button "Add new space"
#     expect(User.all.length).to eq 1
#     expect(TheDate.all.length).to eq 1
#   end
#
#
# end
