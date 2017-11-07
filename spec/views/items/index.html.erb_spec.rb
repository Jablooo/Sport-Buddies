require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :photo_data => "Photo Data",
        :name => "Name",
        :description => "Description",
        :selling_price => "9.99",
        :renting_price => "9.99",
        :quantity => 2,
        :user => nil
      ),
      Item.create!(
        :photo_data => "Photo Data",
        :name => "Name",
        :description => "Description",
        :selling_price => "9.99",
        :renting_price => "9.99",
        :quantity => 2,
        :user => nil
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Photo Data".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
