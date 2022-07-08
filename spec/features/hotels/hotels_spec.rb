require 'rails_helper'

RSpec.describe 'hotel table' do
  it 'shows the name of each hotel record in the system' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)

    visit '/hotels'

    expect(page).to have_content(marriott.name)
    expect(page).to have_content(hyatt.name)
  end

  it 'shows the hotel with that ID and its attributes' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)

    visit "/hotels/#{marriott.id}"

    expect(page).to have_content(marriott.name)
    expect(page).to have_content(marriott.city)
    expect(page).to have_content(marriott.booked)
    expect(page).to have_content(marriott.capacity)
    expect(page).to_not have_content(hyatt.name)

    visit "/hotels/#{hyatt.id}"

    expect(page).to have_content(hyatt.name)
    expect(page).to have_content(hyatt.city)
    expect(page).to have_content(hyatt.booked)
    expect(page).to have_content(hyatt.capacity)
    expect(page).to_not have_content(marriott.name)
  end

#   As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
  xit 'lists hotels by most recently and displays when it was created' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)

    visit '/hotels'

    expect(page).to have_content(hyatt.created_at)
  end
end
