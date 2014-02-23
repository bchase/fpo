require 'spec_helper'

describe "expressions/show" do
  before(:each) do
    @expression = assign(:expression, stub_model(Expression,
      :card => nil,
      :char_num => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
