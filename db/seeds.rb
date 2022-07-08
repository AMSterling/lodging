# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Room.destroy_all
Hotel.destroy_all

  marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)

  standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
  deluxe = marriott.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 2)

  hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)

  king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
  suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)
