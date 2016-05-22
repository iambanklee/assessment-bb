require 'rails_helper'

RSpec.describe "votes/edit", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :campaign => "MyString",
      :validity => "MyString",
      :choice => "MyString"
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input#vote_campaign[name=?]", "vote[campaign]"

      assert_select "input#vote_validity[name=?]", "vote[validity]"

      assert_select "input#vote_choice[name=?]", "vote[choice]"
    end
  end
end
