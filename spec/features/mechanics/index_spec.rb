require "rails_helper"

RSpec.describe "As a user" do
  it "visits mechanics index page and see's their name and years of experience" do
    mechanic1 = Mechanic.create({name: "Nick", experience: 6})
    mechanic2 = Mechanic.create({name: "Billy", experience: 3})

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")

    expect(page).to have_content("Name: #{mechanic1.name}")
    expect(page).to have_content("Years of Experience: #{mechanic1.experience}")

    expect(page).to have_content("Name: #{mechanic2.name}")
    expect(page).to have_content("Years of Experience: #{mechanic2.experience}")

  end
end



# As a user,
# When I visit a mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# Ex:
#              All Mechanics
#    Sam Mills - 10 years of experience
#    Kara Smith - 11 years of experience
