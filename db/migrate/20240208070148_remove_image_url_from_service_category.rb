class RemoveImageUrlFromServiceCategory < ActiveRecord::Migration[7.1]
  def change
    remove_column :service_categories, :image_url, :string
  end
end
