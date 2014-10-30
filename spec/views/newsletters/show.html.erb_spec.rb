require 'spec_helper'

describe "newsletters/show" do
  before(:each) do
    @newsletter = assign(:newsletter, stub_model(Newsletter,
      :to => "MyText",
      :blog_id => 1,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Status/)
  end
end
