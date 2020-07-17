require "rails_helper"

RSpec.describe "As a visitor" do
  describe 'visiting and mechanics show page' do
    it 'see\s a mechanics name, years of experience, and rides theyre working on' do
      mechanic1 = Mechanic.create({name: "Nick", experience: 6})
      park1 = Park.create({name: "Adventure Land", admission_price: 50})
      ride1 = park1.rides.create({name: "Scream Machine", thrill_rating: 10, park_id: park1.id})
      ride2 = park1.rides.create({name: "Carousel Fun Time", thrill_rating: 5, park_id: park1.id})
      RideMechanic.create(ride_id: ride1.id, mechanic_id: mechanic1.id)
      RideMechanic.create(ride_id: ride2.id, mechanic_id: mechanic1.id)

      visit "mechanics/#{mechanic1.id}"

      expect(page).to have_content("Mechanic: #{mechanic1.name}")
      expect(page).to have_content("Years of Experience: #{mechanic1.experience}")
      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content("#{ride1.name}")
      expect(page).to have_content("#{ride2.name}")
    end

    it 'user can add to mechanics worload' do
      mechanic1 = Mechanic.create({name: "Nick", experience: 6})
      park1 = Park.create({name: "Adventure Land", admission_price: 50})
      ride1 = park1.rides.create({name: "Scream Machine", thrill_rating: 10, park_id: park1.id})
      ride2 = park1.rides.create({name: "Carousel Fun Time", thrill_rating: 5, park_id: park1.id})
      RideMechanic.create(ride_id: ride1.id, mechanic_id: mechanic1.id)
      RideMechanic.create(ride_id: ride2.id, mechanic_id: mechanic1.id)

      # fill in form

      # expect page to have new ride listed... theres no time!! AHHHHHH

      visit "mechanics/#{mechanic1.id}"

      fill_in('name', with: 'ride')
      expect(page).to have_content("#{ride.name}")


    end
  end
end






# Story 3
# As a user,
# When I go to a mechanics show page
# I see their name, years of experience, and names of all rides they’re working on
# And I also see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
# Add a ride to workload:
# _pretent_this_is_a_textfield_
