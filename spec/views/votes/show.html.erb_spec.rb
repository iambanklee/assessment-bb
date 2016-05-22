require 'rails_helper'

RSpec.describe "votes/show", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :campaign => "Campaign",
      :validity => "Validity",
      :choice => "Choice"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Campaign/)
    expect(rendered).to match(/Validity/)
    expect(rendered).to match(/Choice/)
  end
end
