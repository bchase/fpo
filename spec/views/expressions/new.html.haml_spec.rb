require 'spec_helper'

describe "expressions/new" do
  before(:each) do
    assign(:expression, stub_model(Expression,
      :card => nil,
      :char_num => 1
    ).as_new_record)
  end

  it "renders new expression form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", expressions_path, "post" do
      assert_select "input#expression_card[name=?]", "expression[card]"
      assert_select "input#expression_char_num[name=?]", "expression[char_num]"
    end
  end
end
