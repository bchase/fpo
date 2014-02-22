require 'spec_helper'

describe "texts/index" do
  before(:each) do
    assign(:texts, [
      stub_model(Text,
        :name => "Name",
        :episode => "Episode",
        :artist => "Artist",
        :raw => "MyText"
      ),
      stub_model(Text,
        :name => "Name",
        :episode => "Episode",
        :artist => "Artist",
        :raw => "MyText"
      )
    ])
  end

  it "renders a list of texts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Episode".to_s, :count => 2
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
