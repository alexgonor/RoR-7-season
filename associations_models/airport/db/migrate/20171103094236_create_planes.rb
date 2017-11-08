class CreatePlanes < ActiveRecord::Migration[5.1]
  def change
    create_table :planes do |t|
      t.string :model
      t.integer :max_speed
      t.references :flight, foreign_key: true

      t.timestamps
    end
  end
end
