class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :avatar_data
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.date :DOB
      t.string :street
      t.string :postcode
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
