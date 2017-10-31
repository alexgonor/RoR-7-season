class CreateSolders < ActiveRecord::Migration[5.1]
  def change
    create_table :solders do |t|
      t.integer :rank
      t.string :specialization

      t.timestamps
    end
  end
end
