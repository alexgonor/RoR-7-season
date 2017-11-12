class AddAvatarToWaiters < ActiveRecord::Migration[5.1]
  def change
    add_column :waiters, :avatar, :string
  end
end
