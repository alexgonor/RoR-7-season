class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.string :uid
      t.text :context

      t.timestamps
    end
  end
end
