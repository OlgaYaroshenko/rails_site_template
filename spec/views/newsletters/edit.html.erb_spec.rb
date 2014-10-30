require 'spec_helper'

describe "newsletters/edit" do
  before(:each) do
    @newsletter = assign(:newsletter, stub_model(Newsletter,
      :to => "MyText",
      :blog_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit newsletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newsletter_path(@newsletter), "post" do
      assert_select "textarea#newsletter_to[name=?]", "newsletter[to]"
      assert_select "input#newsletter_blog_id[name=?]", "newsletter[blog_id]"
      assert_select "input#newsletter_status[name=?]", "newsletter[status]"
    end
  end
end
