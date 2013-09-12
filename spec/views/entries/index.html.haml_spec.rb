require 'spec_helper'

describe "entries/index" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
        :physical_location => "Physical Location",
        :place => "Place",
        :mood => "Mood",
        :positive_activity => "Positive Activity"
      ),
      stub_model(Entry,
        :physical_location => "Physical Location",
        :place => "Place",
        :mood => "Mood",
        :positive_activity => "Positive Activity"
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Physical Location".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
    assert_select "tr>td", :text => "Mood".to_s, :count => 2
    assert_select "tr>td", :text => "Positive Activity".to_s, :count => 2
  end
end
