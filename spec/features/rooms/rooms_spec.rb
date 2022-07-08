require 'rails_helper'

RSpec.describe 'rooms table' do
  it 'shows each room and its attributes' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    deluxe = marriott.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 2)

    visit '/rooms'

    expect(page).to have_content(standard.name)
    expect(page).to have_content(standard.occupied)
    expect(page).to have_content(standard.guest_count)
  end

  it 'shows the room with that ID with its attributes' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    deluxe = marriott.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 2)

    visit "/rooms/#{standard.id}"

    expect(page).to have_content(standard.name)
    expect(page).to have_content(standard.occupied)
    expect(page).to have_content(standard.guest_count)
    expect(page).to_not have_content(deluxe.name)
  end
end
