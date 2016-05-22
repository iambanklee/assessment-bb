require 'rails_helper'

RSpec.describe "votes/new", type: :view do
  before(:each) do
    assign(:vote, Vote.new(
      :campaign => "MyString",
      :validity => "MyString",
      :choice => "MyString"
    ))
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do

      assert_select "input#vote_campaign[name=?]", "vote[campaign]"

      assert_select "input#vote_validity[name=?]", "vote[validity]"

      assert_select "input#vote_choice[name=?]", "vote[choice]"
    end
  end
end
