class Trade < ActiveRecord::Base
	has_many :shifts, :through => :posted_shifts 
end
