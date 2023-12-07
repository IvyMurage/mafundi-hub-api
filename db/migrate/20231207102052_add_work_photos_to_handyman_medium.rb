class AddWorkPhotosToHandymanMedium < ActiveRecord::Migration[7.1]
  def change
    add_column :handyman_media, :work_photos, :string, array: true, default: []
  end
end
