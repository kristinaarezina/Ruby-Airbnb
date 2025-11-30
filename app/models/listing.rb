class Listing < ApplicationRecord
  extend FriendlyId
  
  has_rich_text :description
  has_many_attached :images
  
  friendly_id :title, use: :slugged
  
end
