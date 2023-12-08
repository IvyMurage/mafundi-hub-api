class AddMediaUrlToHandyman < ActiveRecord::Migration[7.1]
  def change
    add_column :handymen, :media_url, :text
  end
end
