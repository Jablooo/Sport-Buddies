class Profile < ApplicationRecord
  belongs_to :user
  has_many :skills
  has_many :sports, class_name: 'Profile', through: :skills


  include ImageUploader[:avatar]

  def sports_played
    @profile.inspect
  end
end
