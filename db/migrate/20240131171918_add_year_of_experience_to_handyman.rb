class AddYearOfExperienceToHandyman < ActiveRecord::Migration[7.1]
  def change
    add_column :handymen, :year_of_experience, :integer
  end
end
