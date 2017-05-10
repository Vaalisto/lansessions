class Lanparty < ActiveRecord::Base
	has_many :participants, dependent: :destroy
	has_many :users, through: :participants
	has_many :partygames, dependent: :destroy
	has_may :games, through: :partygames

	validates :partyname, presence: true
	validates :address, presence: true
	validates :city, presence: true

	def start_time
		self.startdate
	end

	def end_time
		self.enddate
	end
end
