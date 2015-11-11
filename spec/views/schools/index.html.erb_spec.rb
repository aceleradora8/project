require 'rails_helper'

RSpec.describe "schools/index", type: :view do
  before(:each) do
    assign(:schools, [
      School.create!(
        :nome => "Nome"
      ),
      School.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of schools" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
