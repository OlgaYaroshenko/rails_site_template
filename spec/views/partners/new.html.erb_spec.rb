require 'spec_helper'

describe "partners/new" do
  before(:each) do
    assign(:partner, stub_model(Partner,
      :name => "MyString",
      :site => "MyString",
      :visible => false,
      :type => "",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new partner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", partners_path, "post" do
      assert_select "input#partner_name[name=?]", "partner[name]"
      assert_select "input#partner_site[name=?]", "partner[site]"
      assert_select "input#partner_visible[name=?]", "partner[visible]"
      assert_select "input#partner_type[name=?]", "partner[type]"
      assert_select "input#partner_country[name=?]", "partner[country]"
    end
  end
end
