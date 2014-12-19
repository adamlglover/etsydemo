class Listing < ActiveRecord::Base
 
  def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Listing.create! row.to_hash
  end
end
 
  mount_uploader :image, ImageUploader
  
  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0}
  validates_presence_of :image
  belongs_to :user
  has_many :orders
end
