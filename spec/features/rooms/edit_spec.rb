require 'rails_helper'

RSpec.describe 'edit room' do
  it 'links to a page where you can update the room' do
    hotel = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    room = hotel.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)

    visit "/rooms/#{room.id}"

    click_button "Edit #{room.name}"

    expect(current_path).to eq("/rooms/#{room.id}/edit")
  end

  it 'can edit the room' do
    hotel = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    room = hotel.rooms.create!(name: 'Buget', occupied: true, guest_count: 1)

    visit "/rooms/#{room.id}"

    expect(page).to have_content('Buget')

    click_button "Edit #{room.name}"

    fill_in('Name', with: 'Budget')
    select(false, from:'Occupied')
    fill_in('Guest count', with: 1)

    click_on 'Update Room'

    expect(current_path).to eq("/rooms/#{room.id}")
    expect(page).to have_content('Budget')
  end
end
