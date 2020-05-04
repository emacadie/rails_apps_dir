require 'spec_helper'

describe "wp_commentmeta/show" do
  before(:each) do
    @wp_commentmetum = assign(:wp_commentmetum, stub_model(WpCommentmetum,
      :meta_id => 1,
      :comment_id => 2,
      :meta_key => "Meta Key",
      :meta_value => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Meta Key/)
    rendered.should match(/MyText/)
  end
end
