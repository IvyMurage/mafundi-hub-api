class AddClientIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :client, null: false, foreign_key: true
  end
end
