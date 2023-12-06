class CreateHandymanMedia < ActiveRecord::Migration[7.1]
  def change
    create_table :handyman_media do |t|
      t.references :handyman, null: false, foreign_key: true
      t.text :media_urls
      t.timestamps
    end
  end
end
