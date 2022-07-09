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

  it 'lists hotels by most recent and displays when it was created' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)

    visit '/hotels'

    expect(page).to have_content("Ritz Carlton - Created at:")
    expect(page).to have_content("Marriott - Created at:")
    expect(page).to have_content("Hyatt - Created at:")

    within '#hotel-0' do
      expect(page).to have_content("Ritz Carlton")
    end

    within '#hotel-1' do
      expect(page).to have_content("Hyatt")
    end

    within '#hotel-2' do
      expect(page).to have_content("Marriott")
    end
  end

  it 'shows how many rooms a hotel has' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
    suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
    ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
    deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
    executive = ritz.rooms.create!(name: 'executive', occupied: false, guest_count: 6)

    visit "/hotels/#{marriott.id}"

    expect(page).to have_content("Number of rooms: 3")
  end
end
