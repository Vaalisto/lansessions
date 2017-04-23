class Lanparty < ActiveRecord::Base
	validates :lanpartyname, presence: true
	validates :address, presence: true
	validates :city, presence: true
end
