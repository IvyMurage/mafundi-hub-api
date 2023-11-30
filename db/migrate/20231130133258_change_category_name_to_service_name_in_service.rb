class ChangeCategoryNameToServiceNameInService < ActiveRecord::Migration[7.1]
  def change
    rename_column :services, :category_name, :service_name
  end
end
