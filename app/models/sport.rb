class Sport < ApplicationRecord
  has_many :skills
  has_many :profiles, through: :skills

end
