require 'rails_helper'

RSpec.describe Game, type: :model do	
  it "is saved with name" do
  	game = Game.new name:"Halo"
  	expect(game.name).to eq("Halo")
  	expect(game.to_s).to eq("Halo")
  end
end
