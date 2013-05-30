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

class Card < ActiveRecord::Base
  belongs_to :deck
  attr_accessible :back, :front
  validates_presence_of :front, :message => "of the card cannot be empty."
  validates_presence_of :back, :message => "of the card cannot be empty."
end
