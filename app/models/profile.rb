class Profile < ApplicationRecord
  belongs_to :user
  has_many :sports

  include ImageUploader[:avatar]

end
