class Profile < ApplicationRecord
  belongs_to :user

  include ImageUploader[:avatar]

  def self.search(search)
    where("name ILIKE ? OR description ILIKE ? OR condition ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
