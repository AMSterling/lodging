require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/hotels'
# Then I see the name of each hotel(parent) record in the system

RSpec.describe 'shows hotel records' do
  it 'shows the name of each hotel record in the system' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)

    visit '/hotels'

    expect(page).to have_content(marriott.name)
    expect(page).to have_content(hyatt.name)
  end

#   User Story 2, Parent Show
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

  it 'shows the hotel with that ID and its attributes' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)

    visit "/hotels/#{marriott.id}"

    expect(page).to have_content(marriott.name)
    expect(page).to have_content(marriott.city)
    expect(page).to have_content(marriott.booked)
    expect(page).to have_content(marriott.capacity)

    visit "/hotels/#{hyatt.id}"

    expect(page).to have_content(hyatt.name)
    expect(page).to have_content(hyatt.city)
    expect(page).to have_content(hyatt.booked)
    expect(page).to have_content(hyatt.capacity)
  end
end
