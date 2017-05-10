class Partygame < ActiveRecord::Base
	belongs_to :lanparty
	belongs_to :game
end
