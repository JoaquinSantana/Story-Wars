require 'spec_helper'

describe "stories/new" do
  before(:each) do
    assign(:story, stub_model(Story,
      :content => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stories_path, "post" do
      assert_select "input#story_content[name=?]", "story[content]"
      assert_select "input#story_user_id[name=?]", "story[user_id]"
    end
  end
end
