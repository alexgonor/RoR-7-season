class CreateEngines < ActiveRecord::Migration[5.1]
  def change
    create_table :engines do |t|
      t.integer :capasity
      t.integer :power

      t.timestamps
    end
  end
end
