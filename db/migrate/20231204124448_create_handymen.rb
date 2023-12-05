class CreateHandymen < ActiveRecord::Migration[7.1]
  def change
    create_table :handymen do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :title
      t.text :description
      t.string :phone_number
      t.integer :year_of_experience, default: 0
      t.integer :service_id
      t.boolean :availability, default: false
      t.timestamps
    end
  end
end
