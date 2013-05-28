class User < ActiveRecord::Base
  has_many :decks
  attr_accessible :email
end
