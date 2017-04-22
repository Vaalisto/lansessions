require 'rails_helper'

RSpec.describe Rating, type: :model do	
  it "score is set correctly" do
  	rate = Rating.new score: 9
  	expect(rate.score).to eq(9)
  end

  it "score needs to meet requirements" do
    rate = Rating.create score: 11
    expect(rate).not_to be_valid
    expect(Rating.count).to eq(0)
  end

  it "is printed properly with game" do
    game = FactoryGirl.create(:game)
    game.ratings << FactoryGirl.create(:rating)
    expect(Rating.first.to_s).to eq("Halo 9")
  end

end