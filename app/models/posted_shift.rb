class PostedShift < ActiveRecord::Base
	belongs_to :shift, :dependent => :destroy
end
