require 'rails_helper'

RSpec.describe "campaigns/index", type: :view do
  before(:each) do
    assign(:campaigns, [
      Campaign.create!(
        :name => "Name",
        :candidate => "Candidate",
        :score => 1,
        :invalid_score => 2
      ),
      Campaign.create!(
        :name => "Name",
        :candidate => "Candidate",
        :score => 1,
        :invalid_score => 2
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Candidate".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
