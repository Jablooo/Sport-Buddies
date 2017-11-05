class Profile < ApplicationRecord
  belongs_to :user
  has_many :skills
  has_many :sports, through: :skills


  include ImageUploader[:avatar]
end
