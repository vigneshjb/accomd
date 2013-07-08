class Property < ActiveRecord::Base
  attr_accessible :location, :user_id
  belongs_to :user
  has_many :bookings, :dependent =>:destroy

  def self.search(search,user_id)
  if search
    if user_id>0
		  find(:all, :conditions => ['location LIKE ? AND user_id != ?', "%#{search}%", user_id])
    else
      find(:all, :conditions => ['location LIKE ?', "%#{search}%"])
    end
  else
    find(:all)
  end
end
  # named_scope :search 
end
