class AddImageUrlToServiceCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :service_categories, :image_url, :string
  end
end
