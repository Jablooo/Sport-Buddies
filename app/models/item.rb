class Item < ApplicationRecord
  belongs_to :user



  include ImageUploader[:photo]
end
