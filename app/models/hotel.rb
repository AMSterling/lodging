class Hotel < ApplicationRecord
  has_many :rooms

  def self.most_recently_created
    self.order(created_at: :desc)
  end
end
