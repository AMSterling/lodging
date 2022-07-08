require 'rails_helper'

RSpec.describe 'hotel rooms table' do
  it 'shows each room and its attributes' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    deluxe = marriott.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 2)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
    suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)

    visit "/hotels/#{marriott.id}/rooms"
    
    expect(page).to have_content(standard.name)
    expect(page).to have_content(standard.occupied)
    expect(page).to have_content(standard.guest_count)
    expect(page).to_not have_content(king.name)
    expect(page).to_not have_content(king.guest_count)

    visit "/hotels/#{hyatt.id}/rooms"

    expect(page).to have_content(king.name)
    expect(page).to have_content(king.occupied)
    expect(page).to have_content(king.guest_count)
    expect(page).to_not have_content(standard.name)
    expect(page).to_not have_content(standard.guest_count)
  end
end
