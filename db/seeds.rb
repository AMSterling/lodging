Room.destroy_all
Hotel.destroy_all

  marriott = Hotel.create!(name: 'Marriott', city: 'Jacksonville', booked: false, capacity: 400)
  budget = marriott.rooms.create!(name: 'Budget', occupied: true, guest_count: 1)
  standard = marriott.rooms.create!(name: 'Standard', occupied: false, guest_count: 0)
  double = marriott.rooms.create!(name: 'Double', occupied: true, guest_count: 2)

  hyatt = Hotel.create!(name: 'Hyatt', city: 'Denver', booked: false, capacity: 480)
  king = hyatt.rooms.create!(name: 'King', occupied: true, guest_count: 1)
  suite = hyatt.rooms.create!(name: 'Suite', occupied: true, guest_count: 4)

  ritz = Hotel.create!(name: 'Ritz Carlton', city: 'Cleveland', booked: false, capacity: 600)
  deluxe = rit  z.rooms.create!(name: 'Deluxe', occupied: true, guest_count: 3)
  executive = ritz.rooms.create!(name: 'Executive', occupied: false, guest_count: 0)

  wyndam = Hotel.create!(name: 'Wyndam', city: 'Chicago', booked: false, capacity: 540)
  premiere = wyndam.rooms.create!(name: 'Premiere', occupied: true, guest_count: 1)
