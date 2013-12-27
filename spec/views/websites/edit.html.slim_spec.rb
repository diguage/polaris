require 'spec_helper'

describe "websites/edit" do
  before(:each) do
    @website = assign(:website, stub_model(Website,
      :url => "MyString",
      :host => "MyString",
      :title => "MyString",
      :favicon => "MyString",
      :sort => ""
    ))
  end

  it "renders the edit website form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", website_path(@website), "post" do
      assert_select "input#website_url[name=?]", "website[url]"
      assert_select "input#website_host[name=?]", "website[host]"
      assert_select "input#website_title[name=?]", "website[title]"
      assert_select "input#website_favicon[name=?]", "website[favicon]"
      assert_select "input#website_sort[name=?]", "website[sort]"
    end
  end
end
