class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :admin, :crypted_password, :password_salt, :persistence_token, :username, :password, :password_confirmation
  has_many :bookings, :dependent =>:destroy
  has_many :properties, :dependent =>:destroy

end