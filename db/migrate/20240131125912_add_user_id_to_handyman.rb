class AddUserIdToHandyman < ActiveRecord::Migration[7.1]
  def change
    add_column :handymen, :user_id, :integer
  end
end
