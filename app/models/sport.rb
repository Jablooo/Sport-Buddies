class Sport < ApplicationRecord
  has_many :skills
  has_many :profiles, class_name: 'profile', through: :skills

end
