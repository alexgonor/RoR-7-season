class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.belongs_to :plane, foreign_key: true

      t.timestamps
    end
  end
end
