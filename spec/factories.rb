FactoryGirl.define do
	factory :user do
		username "Kalle"
		password "Kallensalis1"
		password_confirmation "Kallensalis1"
	end

	factory :game do
		name "Halo"
		year 1999
		platform "Xbox"
	end

	factory :game2 do
		name "Doom"
		year 1993
		platform "PC"
	end

	factory :rating do
		score 9
	end

	factory :rating2 do
		score 8
	end
end