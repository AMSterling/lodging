require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should allow_value(true).for(:occupied) }
    it { should allow_value(false).for(:occupied) }
    it { should validate_numericality_of :guest_count }
  end

  describe 'relationships' do
    it {should belong_to :hotel}
  end

  describe 'instance methods' do
    describe 'rooms that are occupied' do
      it 'can filter out rooms that are not occupied' do
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
        rooms = Room.all

        expect(budget.occupied?).to be true
        expect(double.occupied?).to be true
        expect(king.occupied?).to be true
        expect(suite.occupied?).to be true
        expect(deluxe.occupied?).to be true
        expect(standard.occupied?).to be false
        expect(executive.occupied?).to be false
      end
    end
  end
end
