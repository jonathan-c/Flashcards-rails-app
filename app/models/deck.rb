# == Schema Information
#
# Table name: decks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards
  attr_accessible :name
  validates_presence_of :name, :message => "cannot be empty."
end
