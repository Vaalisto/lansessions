class Game < ActiveRecord::Base
	has_many :ratings, dependent: :destroy

	validates :name, presence: true

	def to_s
		"#{name}"
	end
end
