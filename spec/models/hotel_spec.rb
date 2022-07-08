require 'rails_helper'

RSpec.describe Hotel, type: :model do
  it {should have_many :rooms}

  describe 'instance methods' do
    describe 'most_recently_created' do
      it 'lists hotels by most recent and displays when it was created' do
        marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
        hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
        hotels = Hotel.all

        expect(hotels.most_recently_created.first).to eq(hyatt)
        expect(hotels.most_recently_created.last).to eq(marriott)
      end
    end
  end
  #   As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created

end
