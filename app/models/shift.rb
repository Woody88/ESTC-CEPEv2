class Shift < ActiveRecord::Base
	belongs_to :user
	has_one :posted_shift, foreign_key:"st_id" 
	before_save :adjust_time_and_date
	POSITIONS = [['Z1 GATES'], ['Z2 GATES'], ['Z3 GATES'], ['Z4 GATES'], ['CKIN DC'], ['CKIN US'], ['CKIN IT']]


	def self.confirm_trade(seller)
		attrs = ["position", "date", "start_time", "finish_time", "original_owner"]
		self.new(seller.attributes_and_values(attrs))
	end

	def attributes_and_values(array)
		result = Hash.new
		array.each do |name|
			result[name] = self.attributes[name]
		end
		result
	end
	
	def adjust_time_and_date
		self.start_time = DateTime.parse("#{date.to_date.to_s} #{start_time.to_s(:time)}")
		self.finish_time = DateTime.parse("#{date.to_date.to_s} #{finish_time.to_s(:time)}")
	end

	def overlaps?(other)
		(start_time - other.finish_time) * (other.start_time - finish_time) > 0
	end

	def as_json(options = {})
    {
      :id => self.id,
      :title => self.position,
      :start => start_time,
      :end => finish_time,
   
    }
  end
end
