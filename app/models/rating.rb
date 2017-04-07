class Rating < ActiveRecord::Base
	belongs_to :game

	validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true}

	def to_s
		"#{game.name} #{score}"
	end
end
