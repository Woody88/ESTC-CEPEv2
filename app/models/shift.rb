class Shift < ActiveRecord::Base
	belongs_to :user
	has_one :posted_shift
	before_save :adjust_time_and_date
	POSITIONS = [['Z1 GATES'], ['Z2 GATES'], ['Z3 GATES'], ['Z4 GATES'], ['CKIN DC'], ['CKIN US'], ['CKIN IT']]

	def adjust_time_and_date
		self.start_time = DateTime.parse("#{date.to_date.to_s} #{start_time.to_s(:time)}")
		self.finish_time = DateTime.parse("#{date.to_date.to_s} #{finish_time.to_s(:time)}")
		s = SecureRandom.urlsafe_base64(8)
		self.shift_id = s
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
      :url => Rails.application.routes.url_helpers.shift_path(shift_id),
    }
  end
end
