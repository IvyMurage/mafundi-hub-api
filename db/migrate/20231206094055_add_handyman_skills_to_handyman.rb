class AddHandymanSkillsToHandyman < ActiveRecord::Migration[7.1]
  def change
    add_column :handymen, :handyman_skills, :text
  end
end
