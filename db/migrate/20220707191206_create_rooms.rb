class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :hotel, foreign_key: true
      t.string :name
      t.boolean :occupied
      t.integer :guest_count
    end
  end
end
