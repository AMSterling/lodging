require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/hotels'
# Then I see the name of each hotel(parent) record in the system

RSpec.describe 'Hotel index' do
  it 'shows the name of each hotel record in the system'
  marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)

  visit '/hotels'

  expect(page).to have_content(hotel.name)
end
