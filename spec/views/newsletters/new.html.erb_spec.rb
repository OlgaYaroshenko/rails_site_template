require 'spec_helper'

describe "newsletters/new" do
  before(:each) do
    assign(:newsletter, stub_model(Newsletter,
      :to => "MyText",
      :blog_id => 1,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new newsletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newsletters_path, "post" do
      assert_select "textarea#newsletter_to[name=?]", "newsletter[to]"
      assert_select "input#newsletter_blog_id[name=?]", "newsletter[blog_id]"
      assert_select "input#newsletter_status[name=?]", "newsletter[status]"
    end
  end
end
