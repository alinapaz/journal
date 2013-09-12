require 'spec_helper'

describe "entries/edit" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :physical_location => "MyString",
      :place => "MyString",
      :mood => "MyString",
      :positive_activity => "MyString"
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do
      assert_select "input#entry_physical_location[name=?]", "entry[physical_location]"
      assert_select "input#entry_place[name=?]", "entry[place]"
      assert_select "input#entry_mood[name=?]", "entry[mood]"
      assert_select "input#entry_positive_activity[name=?]", "entry[positive_activity]"
    end
  end
end
