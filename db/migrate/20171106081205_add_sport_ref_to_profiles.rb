class AddSportRefToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_reference :profiles, :sport, foreign_key: true
  end
end
