require 'spec_helper'

describe "partners/edit" do
  before(:each) do
    @partner = assign(:partner, stub_model(Partner,
      :name => "MyString",
      :site => "MyString",
      :visible => false,
      :type => "",
      :country => "MyString"
    ))
  end

  it "renders the edit partner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", partner_path(@partner), "post" do
      assert_select "input#partner_name[name=?]", "partner[name]"
      assert_select "input#partner_site[name=?]", "partner[site]"
      assert_select "input#partner_visible[name=?]", "partner[visible]"
      assert_select "input#partner_type[name=?]", "partner[type]"
      assert_select "input#partner_country[name=?]", "partner[country]"
    end
  end
end
