class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :client, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.references :handyman, null: false, foreign_key: true
      t.datetime :appointment_date
      t.integer :duration
      t.text :appointment_notes
      t.string :appointment_status
      t.time :appointment_time

      t.timestamps
    end
  end
end
