require 'spec_helper'

describe "categories/edit" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :title => "MyString",
      :sort => 1,
      :parent_id => 1
    ))
  end

  it "renders the edit category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", category_path(@category), "post" do
      assert_select "input#category_title[name=?]", "category[title]"
      assert_select "input#category_sort[name=?]", "category[sort]"
      assert_select "input#category_parent_id[name=?]", "category[parent_id]"
    end
  end
end
