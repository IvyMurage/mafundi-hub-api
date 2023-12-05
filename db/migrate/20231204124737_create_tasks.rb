class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :job_title
      t.references :client, null: false, foreign_key: true
      t.text :task_description
      t.decimal :job_price, precision: 10, scale: 2, default: 0.0
      t.integer :service_id
      t.boolean :available, default: true
      t.boolean :instant_booking, default: false
      t.timestamps
    end
  end
end
