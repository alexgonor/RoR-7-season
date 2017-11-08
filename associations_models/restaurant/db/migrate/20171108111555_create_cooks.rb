class CreateCooks < ActiveRecord::Migration[5.1]
  def change
    create_table :cooks do |t|
      t.string :name

      t.timestamps
    end
  end
end
