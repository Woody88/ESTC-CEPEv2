class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  after_create :build_profile

  has_many :shifts, foreign_key: "current_owner"

  def build_profile
    biding,pr
  	s = SecureRandom.urlsafe_base64(8)
  	Profile.create(user: self, :p_id => s)
  end

end
