require 'rails_helper'

RSpec.describe "ratings/index", type: :view do
  before(:each) do
    assign(:ratings, [
      Rating.create!(
        :score => 2,
        :game_id => 3
      ),
      Rating.create!(
        :score => 2,
        :game_id => 3
      )
    ])
  end

  it "renders a list of ratings" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
