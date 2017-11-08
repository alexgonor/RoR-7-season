class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.belongs_to :menu, foreign_key: true

      t.timestamps
    end
  end
end
