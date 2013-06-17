class User < ActiveRecord::Base
  attr_accessible :email, :isAdmin, :name
  has_many :accomadation
end
