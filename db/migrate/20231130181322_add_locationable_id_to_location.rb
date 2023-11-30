class AddLocationableIdToLocation < ActiveRecord::Migration[7.1]
  def change
    add_reference :locations, :locationable, polymorphic: true, index: true
  end
end
