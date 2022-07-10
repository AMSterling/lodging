require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should allow_value(true).for(:booked) }
    it { should allow_value(false).for(:booked) }
    it { should validate_presence_of :capacity }
  end

  describe 'relationships' do
    it {should have_many :rooms}
  end

  describe 'instance methods' do
    describe 'most_recently_created' do
      it 'lists hotels by most recent and displays when it was created' do
        marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
        hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
        ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
        hotels = Hotel.all

        expect(hotels.most_recently_created.first).to eq(ritz)
        expect(hotels.most_recently_created.last).to eq(marriott)
      end

      describe 'room_count' do
        it 'counts how many rooms each hotel has' do
          marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
          budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
          standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
          double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)
          hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
          king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
          suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
          ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
          deluxe = ritz.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
          executive = ritz.rooms.create!(name: 'executive', occupied: false, guest_count: 6)

          expect(marriott.room_count).to eq 3
          expect(hyatt.room_count).to eq 2
          expect(ritz.room_count).to eq 2
        end
      end
    end
  end
end
