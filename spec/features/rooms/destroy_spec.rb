require 'rails_helper'

RSpec.describe 'destroying a room' do
  it 'can delete the room from its page' do
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
    wyndam = Hotel.create!(name: 'Wyndam', city: 'Chicago', booked: false, capacity: 540)
    premiere = wyndam.rooms.create!(name: 'Premiere', occupied: true, guest_count: 1)

    visit "/rooms/#{premiere.id}"

    click_button 'Delete'

    expect(current_path).to eq('/rooms')
    expect(page).to_not have_content(premiere.name)
  end
end
