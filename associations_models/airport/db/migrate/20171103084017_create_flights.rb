class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :bord_number
      t.integer :passengers_count

      t.timestamps
    end
  end
end
