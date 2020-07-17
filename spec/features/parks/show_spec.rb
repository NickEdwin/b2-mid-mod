require "rails_helper"

RSpec.describe "As a user" do
  before :each do
    @park1 = Park.create({name: "Adventure Land", admission_price: 50})
    @ride1 = @park1.rides.create({name: "Scream Machine", thrill_rating: 10, park_id: @park1.id})
    @ride2 = @park1.rides.create({name: "Carousel Fun Time", thrill_rating: 5, park_id: @park1.id})
  end

  it "visits park show page I see its name and admission price" do

    visit "/parks/#{@park1.id}"

    expect(page).to have_content("#{@park1.name}")
    expect(page).to have_content("Admission Cost: $#{@park1.admission_price}")
  end

  it "also sees all of a parks rides and their average thrill rating" do

    visit "/parks/#{@park1.id}"

    expect(page).to have_content("Rides:")
    expect(page).to have_content("#{@ride2.name}")
    expect(page).to have_content("#{@ride1.name}")
    expect(page).to have_content("Average Thrill Rating of Rides: 7.5/10")

  end
end




# Story 2
# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00
#
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
