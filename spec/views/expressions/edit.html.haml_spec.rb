require 'spec_helper'

describe "expressions/edit" do
  before(:each) do
    @expression = assign(:expression, stub_model(Expression,
      :card => nil,
      :char_num => 1
    ))
  end

  it "renders the edit expression form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", expression_path(@expression), "post" do
      assert_select "input#expression_card[name=?]", "expression[card]"
      assert_select "input#expression_char_num[name=?]", "expression[char_num]"
    end
  end
end
