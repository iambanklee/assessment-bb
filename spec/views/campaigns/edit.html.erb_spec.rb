require 'rails_helper'

RSpec.describe "campaigns/edit", type: :view do
  before(:each) do
    @campaign = assign(:campaign, Campaign.create!(
      :name => "MyString",
      :candidate => "MyString",
      :score => 1,
      :invalid_score => 1
    ))
  end

  it "renders the edit campaign form" do
    render

    assert_select "form[action=?][method=?]", campaign_path(@campaign), "post" do

      assert_select "input#campaign_name[name=?]", "campaign[name]"

      assert_select "input#campaign_candidate[name=?]", "campaign[candidate]"

      assert_select "input#campaign_score[name=?]", "campaign[score]"

      assert_select "input#campaign_invalid_score[name=?]", "campaign[invalid_score]"
    end
  end
end
