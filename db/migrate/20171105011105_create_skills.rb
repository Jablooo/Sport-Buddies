class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.references :profile, foreign_key: true
      t.references :sport, foreign_key: true
      t.string :level

      t.timestamps
    end
  end
end
