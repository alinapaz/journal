require 'spec_helper'

describe "entries/show" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :physical_location => "Physical Location",
      :place => "Place",
      :mood => "Mood",
      :positive_activity => "Positive Activity"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Physical Location/)
    rendered.should match(/Place/)
    rendered.should match(/Mood/)
    rendered.should match(/Positive Activity/)
  end
end
