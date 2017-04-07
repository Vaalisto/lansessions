require 'rails_helper'

RSpec.describe "ratings/new", type: :view do
  before(:each) do
    assign(:rating, Rating.new(
      :score => 1,
      :game_id => 1
    ))
  end

  it "renders new rating form" do
    render

    assert_select "form[action=?][method=?]", ratings_path, "post" do

      assert_select "input#rating_score[name=?]", "rating[score]"

      assert_select "input#rating_game_id[name=?]", "rating[game_id]"
    end
  end
end
