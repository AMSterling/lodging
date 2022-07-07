require 'rails_helper'

RSpec.describe Room, type: :model do
  it {should belong_to :hotel}
end
