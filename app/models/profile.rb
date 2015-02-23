class Profile < ActiveRecord::Base
	belongs_to :user, :dependent => :destroy
	has_many :shifts, foreign_key: "current_owner"
	has_many :shift_for_sell, :class_name => "PostedShift", :foreign_key => "seller_id", :dependent => :destroy
	has_many :microposts, :dependent => :destroy

	def fullname
		"#{fname} #{lname}"
	end
end
