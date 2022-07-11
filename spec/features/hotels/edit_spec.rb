require 'rails_helper'

RSpec.describe 'edit hotel' do
  it 'links to a page where you can update the hotel' do
    hotel = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)

    visit "/hotels/#{hotel.id}"

    click_button "Edit #{hotel.name}"

    expect(current_path).to eq("/hotels/#{hotel.id}/edit")
  end

  it 'can edit the hotel' do
    hotel = Hotel.create!(name: 'Marriot', city: 'Jacksonville', booked: false, capacity: 400)

    visit "/hotels/#{hotel.id}"

    expect(page).to have_content('Marriot')

    click_button "Edit #{hotel.name}"

    fill_in('Name', with: 'Marriott')
    fill_in('City', with: 'Jacksonville')
    select(false, from:'Booked')
    fill_in('Capacity', with: 400)

    click_on 'Update Hotel'

    expect(current_path).to eq("/hotels/#{hotel.id}")
    expect(page).to have_content('Marriott')
  end
end
