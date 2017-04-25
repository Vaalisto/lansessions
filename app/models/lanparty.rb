class Lanparty < ActiveRecord::Base
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
