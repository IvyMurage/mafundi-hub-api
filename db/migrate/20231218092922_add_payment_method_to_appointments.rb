class AddPaymentMethodToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :payment_method, :string
  end
end
