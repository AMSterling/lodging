class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :hotel, foreign_key: true
      t.string :name
      t.boolean :occupied, default: false
      t.integer :guest_count, default: 0

      t.timestamps
    end
  end
end
