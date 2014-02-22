require 'spec_helper'

describe "texts/new" do
  before(:each) do
    assign(:text, stub_model(Text,
      :name => "MyString",
      :episode => "MyString",
      :artist => "MyString",
      :raw => "MyText"
    ).as_new_record)
  end

  it "renders new text form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", texts_path, "post" do
      assert_select "input#text_name[name=?]", "text[name]"
      assert_select "input#text_episode[name=?]", "text[episode]"
      assert_select "input#text_artist[name=?]", "text[artist]"
      assert_select "textarea#text_raw[name=?]", "text[raw]"
    end
  end
end
