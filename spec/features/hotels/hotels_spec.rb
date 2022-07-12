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
      expect(page).to have_content('Ritz Carlton')
    end

    within '#hotel-1' do
      expect(page).to have_content('Hyatt')
    end

    within '#hotel-2' do
      expect(page).to have_content('Marriott')
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
    executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

    visit "/hotels/#{marriott.id}"

    expect(page).to have_content("Number of rooms: 3")

    visit "/hotels/#{hyatt.id}"

    expect(page).to have_content("Number of rooms: 2")
  end

  it 'has a Hotel Index link on every page' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
    suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
    ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
    deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
    executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

    visit "/hotels/#{marriott.id}"

    expect(page).to have_link('Hotel Index')
  end

  it 'takes you to the hotel index when you click the link' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
    suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
    ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
    deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
    executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

    visit "/hotels/#{marriott.id}"
    click_on 'Hotel Index'

    expect(current_path).to eq("/hotels")
  end

  it 'has a room Index link on every page' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
    suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
    ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
    deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
    executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

    visit "/hotels/#{marriott.id}"

    expect(page).to have_link('Room Index')
  end

  it 'takes you to the room index when you click the link' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
    suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
    ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
    deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
    executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

    visit "/hotels/#{marriott.id}"
    click_on 'Room Index'

    expect(current_path).to eq("/rooms")
  end

  it 'has a Room Index link specific to the hotel' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
    suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
    ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
    deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
    executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

    visit "/hotels/#{marriott.id}"

    expect(page).to have_link('Marriott Rooms')

    visit "/hotels/#{hyatt.id}"

    expect(page).to have_link('Hyatt Rooms')

    visit "/hotels/#{ritz.id}"

    expect(page).to have_link('Ritz Carlton Rooms')
  end

  it 'takes you to the hotels rooms when you click the link' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
    suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
    ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
    deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
    executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

    visit "/hotels/#{marriott.id}"
    click_on 'Marriott Rooms'

    expect(current_path).to eq("/hotels/#{marriott.id}/rooms")
  end

  describe 'edit hotel from index' do
    it 'has a link next to each hotel in the index to edit the hotel' do
      marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
      budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
      standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
      double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
      hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
      king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
      suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
      ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
      deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
      executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

      visit '/hotels'

      expect(page).to have_button("Edit #{marriott.name}")
      expect(page).to have_button("Edit #{hyatt.name}")
      expect(page).to have_button("Edit #{ritz.name}")
    end
  end
end
