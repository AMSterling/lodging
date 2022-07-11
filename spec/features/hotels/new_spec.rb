require 'rails_helper'

RSpec.describe 'new hotel creation' do
  it 'links to the new page from the Hotels Index' do

    visit '/hotels'

    expect(page).to have_link('New Hotel')

    click_on 'New Hotel'

    expect(current_path).to eq('/hotels/new')
  end

  it 'can create a new hotel' do
    visit '/hotels/new'
    fill_in('Name', with: 'Wyndham')
    fill_in('City', with: 'Chicago')
    select(false, from:'Booked')
    fill_in('Capacity', with: 460)
    click_button('Create Hotel')

    new_hotel_id = Hotel.last.id

    expect(current_path).to eq('/hotels')
    expect(page).to have_content('Wyndham')
  end
end
