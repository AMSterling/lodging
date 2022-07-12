class Hotel < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :city
  validates :booked, inclusion:[true, false]
  validates_numericality_of :capacity
  has_many :rooms, :dependent => :destroy

  def self.most_recently_created
    self.order(created_at: :desc)
  end

  def room_count
    self.rooms.count
  end
end
