require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :name => "Name"
      ),
      Question.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
