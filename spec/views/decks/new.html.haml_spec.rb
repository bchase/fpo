require 'spec_helper'

describe "decks/new" do
  before(:each) do
    assign(:deck, stub_model(Deck,
      :user => nil
    ).as_new_record)
  end

  it "renders new deck form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", decks_path, "post" do
      assert_select "input#deck_user[name=?]", "deck[user]"
    end
  end
end
