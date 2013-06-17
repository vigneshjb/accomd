class Accomadation < ActiveRecord::Base
  attr_accessible :isBooked, :location, :user_id
  belongs_to :user
end
