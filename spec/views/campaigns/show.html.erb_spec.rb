require 'rails_helper'

RSpec.describe "campaigns/show", type: :view do
  before(:each) do
    @campaign = assign(:campaign, Campaign.create!(
      :name => "Name",
      :candidate => "Candidate",
      :score => 1,
      :invalid_score => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Candidate/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
