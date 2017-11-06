class AddProfileRefToSkills < ActiveRecord::Migration[5.1]
  def change
    add_reference :skills, :sport, foreign_key: true
  end
end
