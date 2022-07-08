require 'rails_helper'

RSpec.describe 'hotel rooms tables' do
#   As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
  xit 'shows each room and its attributes' do
    marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
    standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
    deluxe = marriott.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 2)

    visit "/hotels/#{marriott.id}/rooms"

    expect(page).to have_content(standard.name)
    expect(page).to have_content(standard.occupied)
    expect(page).to have_content(standard.guest_count)
  end
end
