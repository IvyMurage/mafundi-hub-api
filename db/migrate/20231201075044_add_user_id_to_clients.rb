class AddUserIdToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :user_id, :integer
  end
end
