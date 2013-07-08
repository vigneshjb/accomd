class Booking < ActiveRecord::Base
  attr_accessible :from, :to, :user_id, :property_id
  belongs_to :user
  belongs_to :property

def self.validate(from, to, prop)
	from = Date.strptime(from, "%m/%d/%Y")
	to = Date.strptime(to, "%m/%d/%Y")
	@test_booking=find(:all, :conditions => ["(property_id = ? AND 
        (((? > `from` AND ? < `to`) OR (? > `from` AND ? < `to`)) OR (? < `from` AND ? > `to`)))",
		prop, from, from, to, to, from, to ] )
	if (@test_booking.count!=0)
		true
	else
		false
	end	
end

end
