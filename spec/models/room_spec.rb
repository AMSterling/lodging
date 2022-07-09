require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should allow_value(true).for(:occupied) }
    it { should allow_value(false).for(:occupied) }
    it { should validate_presence_of :guest_count }
  end

  describe 'relationships' do
    it {should belong_to :hotel}
  end
end
