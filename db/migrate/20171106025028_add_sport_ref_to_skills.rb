class AddSportRefToSkills < ActiveRecord::Migration[5.1]
  def change
    add_reference :skills, :profile, foreign_key: true
  end
end
