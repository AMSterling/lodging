require 'rails_helper'

RSpec.describe 'hotel rooms table' do
  it 'shows each room and its attributes' do
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

    visit "/hotels/#{marriott.id}/rooms"

    expect(page).to have_content(budget.name)
    expect(page).to have_content(budget.occupied)
    expect(page).to have_content(budget.guest_count)
    expect(page).to have_content(standard.name)
    expect(page).to have_content(standard.occupied)
    expect(page).to have_content(standard.guest_count)
    expect(page).to have_content(double.name)
    expect(page).to have_content(double.occupied)
    expect(page).to have_content(double.guest_count)
    expect(page).to_not have_content(king.name)
    expect(page).to_not have_content(suite.name)
    expect(page).to_not have_content(deluxe.name)
    expect(page).to_not have_content(executive.name)

    visit "/hotels/#{hyatt.id}/rooms"

    expect(page).to have_content(king.name)
    expect(page).to have_content(king.occupied)
    expect(page).to have_content(king.guest_count)
    expect(page).to have_content(suite.name)
    expect(page).to have_content(suite.occupied)
    expect(page).to have_content(suite.guest_count)
    expect(page).to_not have_content(budget.name)
    expect(page).to_not have_content(standard.name)
    expect(page).to_not have_content(double.name)
    expect(page).to_not have_content(deluxe.name)
    expect(page).to_not have_content(executive.name)

    visit "/hotels/#{ritz.id}/rooms"

    expect(page).to have_content(deluxe.name)
    expect(page).to have_content(deluxe.occupied)
    expect(page).to have_content(deluxe.guest_count)
    expect(page).to have_content(executive.name)
    expect(page).to have_content(executive.occupied)
    expect(page).to have_content(executive.guest_count)
    expect(page).to_not have_content(budget.name)
    expect(page).to_not have_content(standard.name)
    expect(page).to_not have_content(double.name)
    expect(page).to_not have_content(king.name)
    expect(page).to_not have_content(suite.name)
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

    visit "/hotels/#{marriott.id}/rooms"

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

    visit "/hotels/#{marriott.id}/rooms"

    click_on 'Hotel Index'

    expect(current_path).to eq("/hotels")
  end

  it 'has a Room Index link on every page' do
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

    visit "/hotels/#{marriott.id}/rooms"

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

    visit "/hotels/#{marriott.id}/rooms"

    click_on 'Room Index'

    expect(current_path).to eq("/rooms")
  end

  describe 'sort alphabetically' do
    it 'links to a page that sorts rooms alphabetically' do
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

      visit "/hotels/#{marriott.id}/rooms"

      within '#room-0' do
        expect(page).to have_content('Budget')
      end

      within '#room-1' do
        expect(page).to have_content('Standard')
      end

      within '#room-2' do
        expect(page).to have_content('Double')
      end

      click_on 'Sort Rooms Alphabetically'

      within '#room-0' do
        expect(page).to have_content('Budget')
      end

      within '#room-1' do
        expect(page).to have_content('Double')
      end

      within '#room-2' do
        expect(page).to have_content('Standard')
      end

      expect(current_path).to eq("/hotels/#{marriott.id}/rooms")
    end
  end

  describe 'records over a given threshold' do
    it 'displays a form to input an integer value' do
      marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
      budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
      standard = marriott.rooms.create!(name: 'Standard', occupied: true, guest_count: 2)
      double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 4)

      hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
      king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
      suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)

      ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
      deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
      executive = ritz.rooms.create!(name: 'Executive', occupied: true, guest_count: 6)

      wyndam = Hotel.create!(name: 'Wyndam', city: 'Chicago', booked: false, capacity: 540)
      premiere = wyndam.rooms.create!(name: 'Premiere', occupied: true, guest_count: 3)

      visit "/hotels/#{marriott.id}/rooms"

      fill_in("rooms_with_more_than", with: 2)

      click_button 'Search'

      expect(page).to have_content(double.name)
      expect(page).to_not have_content(budget.name)
    end
  end
end
