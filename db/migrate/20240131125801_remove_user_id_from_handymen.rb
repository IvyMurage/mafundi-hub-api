class RemoveUserIdFromHandymen < ActiveRecord::Migration[7.1]
  def change
    remove_column :handymen, :user_id, :bigint
  end
end
