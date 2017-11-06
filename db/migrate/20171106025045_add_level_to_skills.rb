class AddLevelToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :level, :string
  end
end
