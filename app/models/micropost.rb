class Micropost < ActiveRecord::Base
  belongs_to :profile
  validates :content, presence: true, length: { maximum: 400 }
end
