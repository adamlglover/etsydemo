class Listing < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  validates :name, :description, :price, presence: true
end
