# == Schema Information
#
# Table name: listings
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#  image       :string(255)
#  user_id     :integer
#

require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
