class Lanparty < ActiveRecord::Base	
	has_many :participants, dependent: :destroy
	has_many :users, through: :participants
	has_many :partygames, dependent: :destroy
	has_many :games, through: :partygames
	accepts_nested_attributes_for :partygames

	validates :partyname, presence: true
	validates :address, presence: true
	validates :city, presence: true

	def start_time
		self.startdate
	end

	def end_time
		self.enddate
	end

	def address_line
		ERB::Util.url_encode("#{address} #{city}")
	end

	def gmaps_url
		"//www.google.com/maps/embed/v1/place?q=#{address_line}&zoom=17&key=#{ENV['GOOGLE_API']}"
	end
end
