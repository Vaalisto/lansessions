class Participant < ActiveRecord::Base
	belongs_to :lanparty
	belongs_to :user
end
