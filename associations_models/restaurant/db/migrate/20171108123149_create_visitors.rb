class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :name
      t.belongs_to :waiter, foreign_key: true

      t.timestamps
    end
  end
end
