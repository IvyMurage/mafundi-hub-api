class RemoveYearOfExperienceFromHandyman < ActiveRecord::Migration[7.1]
  def change
    remove_column :handymen, :year_of_experience, :integer
  end
end
