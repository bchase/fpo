require 'spec_helper'

describe "cards/new" do
  before(:each) do
    assign(:card, stub_model(Card,
      :front => "MyText",
      :back => "MyText",
      :deck => nil
    ).as_new_record)
  end

  it "renders new card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cards_path, "post" do
      assert_select "textarea#card_front[name=?]", "card[front]"
      assert_select "textarea#card_back[name=?]", "card[back]"
      assert_select "input#card_deck[name=?]", "card[deck]"
    end
  end
end
