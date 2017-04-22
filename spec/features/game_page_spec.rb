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
			click_button "Create Game"
		}.to change{Game.count}.from(0).to(1)
	end

	it 'game is not created without name' do
		visit new_game_path
		fill_in('game_year', with:"1999")
		fill_in('game_platform', with:"Nintari")		
		click_button "Create Game"
		expect(Game.count).to eq(0)
		expect(page).to have_content "Name can't be blank"
	end

end