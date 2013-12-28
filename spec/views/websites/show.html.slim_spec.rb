require 'spec_helper'

describe "websites/show" do
  before(:each) do
    @website = assign(:website, stub_model(Website,
      :url => "Url",
      :host => "Host",
      :title => "Title",
      :favicon => "Favicon",
      :sort => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/Host/)
    rendered.should match(/Title/)
    rendered.should match(/Favicon/)
    rendered.should match(//)
  end
end
