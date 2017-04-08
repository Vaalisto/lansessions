class Game < ActiveRecord::Base
	include RatingAverage
	
	has_many :ratings, dependent: :destroy

	validates :name, presence: true

	def to_s
		"#{name}"
	end
end
