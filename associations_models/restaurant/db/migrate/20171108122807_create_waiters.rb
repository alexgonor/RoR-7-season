class CreateWaiters < ActiveRecord::Migration[5.1]
  def change
    create_table :waiters do |t|
      t.string :name
      t.belongs_to :cook, foreign_key: true

      t.timestamps
    end
  end
end
