class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :city
      t.boolean :booked, default: false
      t.integer :capacity

      t.timestamps
    end
  end
end
