class CreateJoinTableSkills < ActiveRecord::Migration[5.1]
  def change
    create_join_table :sports, :profiles, table_name: :skills do |t|
      t.index [:sport_id, :profile_id], unique: true
      t.string :level
      t.timestamp :created_at
    end
  end
end
