class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :task_id
      t.integer :rating
      t.integer :handyman_id

      t.timestamps
    end
  end
end
