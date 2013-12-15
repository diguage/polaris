require 'spec_helper'

describe "websites/index" do
  before(:each) do
    assign(:websites, [
      stub_model(Website,
        :url => "Url",
        :host => "Host",
        :title => "Title",
        :favicon => "Favicon",
        :sort => ""
      ),
      stub_model(Website,
        :url => "Url",
        :host => "Host",
        :title => "Title",
        :favicon => "Favicon",
        :sort => ""
      )
    ])
  end

  it "renders a list of websites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Host".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Favicon".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
