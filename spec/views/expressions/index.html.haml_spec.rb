require 'spec_helper'

describe "expressions/index" do
  before(:each) do
    assign(:expressions, [
      stub_model(Expression,
        :card => nil,
        :char_num => 1
      ),
      stub_model(Expression,
        :card => nil,
        :char_num => 1
      )
    ])
  end

  it "renders a list of expressions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
