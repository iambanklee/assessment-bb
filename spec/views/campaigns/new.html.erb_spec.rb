require 'rails_helper'

RSpec.describe "campaigns/new", type: :view do
  before(:each) do
    assign(:campaign, Campaign.new(
      :name => "MyString",
      :candidate => "MyString",
      :score => 1,
      :invalid_score => 1
    ))
  end

  it "renders new campaign form" do
    render

    assert_select "form[action=?][method=?]", campaigns_path, "post" do

      assert_select "input#campaign_name[name=?]", "campaign[name]"

      assert_select "input#campaign_candidate[name=?]", "campaign[candidate]"

      assert_select "input#campaign_score[name=?]", "campaign[score]"

      assert_select "input#campaign_invalid_score[name=?]", "campaign[invalid_score]"
    end
  end
end
