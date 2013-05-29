# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  front      :string(255)
#  back       :string(255)
#  deck_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
