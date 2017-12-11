class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :conversation_id
      t.string :kind

      t.timestamps
    end
  end
end
