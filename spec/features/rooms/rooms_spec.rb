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
    budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
    hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
    king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
    suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
    ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
    deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
    executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

    visit "/rooms/#{standard.id}"

    expect(page).to have_content(standard.name)
    expect(page).to have_content(standard.occupied)
    expect(page).to have_content(standard.guest_count)
    expect(page).to_not have_content(budget.name)
    expect(page).to_not have_content(double.name)
    expect(page).to_not have_content(king.name)
    expect(page).to_not have_content(suite.name)
    expect(page).to_not have_content(deluxe.name)
    expect(page).to_not have_content(executive.name)
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

    visit "/rooms/#{budget.id}"

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

    visit "/rooms/#{budget.id}"
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

    visit "/rooms/#{budget.id}"

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

    visit "/rooms/#{budget.id}"
    click_on 'Room Index'

    expect(current_path).to eq("/rooms")
  end

  describe 'edit room' do
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
      save_and_open_page
      fill_in('Name', with: 'Budget')
      select(false, from:'Occupied')
      fill_in('Guest count', with: 1)

      click_on 'Update Room'

      expect(current_path).to eq("/rooms/#{room.id}")
      expect(page).to have_content('Budget')
      
    end
  end

  describe 'only show occupied rooms' do
    it ' only shows rooms where occupied value is true' do
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

      visit '/rooms'

      expect(page).to have_content('Budget')
      expect(page).to have_content('Double')
      expect(page).to have_content('King')
      expect(page).to have_content('Suite')
      expect(page).to have_content('Deluxe')
      expect(page).to_not have_content('Standard')
      expect(page).to_not have_content('Executive')
    end
  end
end
