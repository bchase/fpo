require 'spec_helper'

describe "texts/show" do
  before(:each) do
    @text = assign(:text, stub_model(Text,
      :name => "Name",
      :episode => "Episode",
      :artist => "Artist",
      :raw => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Episode/)
    rendered.should match(/Artist/)
    rendered.should match(/MyText/)
  end
end
