class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :city
      t.boolean :booked
      t.integer :capacity
    end
  end
end
