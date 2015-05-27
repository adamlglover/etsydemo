# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  state      :string(255)
#  city       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  listing_id :integer
#  buyer_id   :integer
#  seller_id  :integer
#

class Order < ActiveRecord::Base
  
#  validates :address, :city, :state, presence: true
  
  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
end
