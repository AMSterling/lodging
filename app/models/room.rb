class Room < ApplicationRecord
  validates_presence_of :name
  validates :occupied, inclusion: [true, false]
  validates_numericality_of :guest_count
  belongs_to :hotel

  def self.alphabetical
    order(:name)
  end
end
