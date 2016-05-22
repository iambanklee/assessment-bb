require 'rails_helper'

RSpec.describe "votes/index", type: :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(
        :campaign => "Campaign",
        :validity => "Validity",
        :choice => "Choice"
      ),
      Vote.create!(
        :campaign => "Campaign",
        :validity => "Validity",
        :choice => "Choice"
      )
    ])
  end

  it "renders a list of votes" do
    render
    assert_select "tr>td", :text => "Campaign".to_s, :count => 2
    assert_select "tr>td", :text => "Validity".to_s, :count => 2
    assert_select "tr>td", :text => "Choice".to_s, :count => 2
  end
end
