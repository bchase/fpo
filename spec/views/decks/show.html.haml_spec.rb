require 'spec_helper'

describe "decks/show" do
  before(:each) do
    @deck = assign(:deck, stub_model(Deck,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
