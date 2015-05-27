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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
