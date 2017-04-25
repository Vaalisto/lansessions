class Lanparty < ActiveRecord::Base
	validates :partyname, presence: true
	validates :address, presence: true
	validates :city, presence: true
end
