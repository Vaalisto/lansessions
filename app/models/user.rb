class User < ActiveRecord::Base
	has_many :ratings, dependent: :destroy
	has_many :games, through: :ratings
	has_many :participants, dependent: :destroy
	has_many :lanparties, through: :participants

	has_secure_password

	validates :username, uniqueness: true, length: { in: 4..30 }
	validates :password, length: { minimum: 6 }
	validates :password, format: { with: /([A-Z].*\d)|(\d.*[A-Z].*)/, message: "should contain one number and one capital letter" }
end
