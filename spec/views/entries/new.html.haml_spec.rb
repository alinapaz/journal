require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :physical_location => "MyString",
      :place => "MyString",
      :mood => "MyString",
      :positive_activity => "MyString"
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entries_path, "post" do
      assert_select "input#entry_physical_location[name=?]", "entry[physical_location]"
      assert_select "input#entry_place[name=?]", "entry[place]"
      assert_select "input#entry_mood[name=?]", "entry[mood]"
      assert_select "input#entry_positive_activity[name=?]", "entry[positive_activity]"
    end
  end
end
