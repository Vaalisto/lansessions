require 'rails_helper'

include Helpers

describe "Games page" do
	let!(:user) { FactoryGirl.create :user }	

	before :each do
		sign_in(username:"Kalle", password:"Kallensalis1")
	end

	it "game is created with valid name" do
		visit new_game_path
		fill_in('game_name', with:"Ninja")
		fill_in('game_year', with:"1984")
		fill_in('game_platform', with:"C64")
		expect{
			click_button "Submit"
		}.to change{Game.count}.from(0).to(1)
	end

	it "game is not created without name" do
		visit new_game_path
		fill_in('game_year', with:"1999")
		fill_in('game_platform', with:"Nintari")		
		click_button "Submit"
		expect(Game.count).to eq(0)
		expect(page).to have_content "Name can't be blank"
	end

	describe "Games index" do
		let!(:game) { FactoryGirl.create :game }
		let!(:game2) { FactoryGirl.create :game2 }

		it "Games are shown correctly" do
			visit games_path
			expect(page).to have_content "Halo"
			expect(page).to have_content "Doom"
		end

	end

	describe "Updating game" do
		let!(:game) { FactoryGirl.create :game, :id => 1 }

		it "Game is updated when edited correctly" do
			visit "/games/1/edit"
			fill_in('game_name', with:"Hola")
			click_button "Submit"
			expect(page).to have_content "Hola"
		end

		it "Game update rerenders when edited incorrectly" do
			visit "/games/1/edit"
			fill_in('game_name', with:"")
			click_button "Submit"
			expect(page).to have_content "Name can't be blank"
		end
	end

	describe "Game ratings" do
		let!(:game) { FactoryGirl.create :game, :id => 1 }

		it "Ratings are shown correctly" do
			game.ratings << FactoryGirl.create(:rating)
			game.ratings << FactoryGirl.create(:rating2)
			visit "/games/1/"
			expect(page).to have_content "The game has 2 ratings with average of 8.5"
		end
	end

end