require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :photo_data => "MyString",
      :name => "MyString",
      :description => "MyString",
      :selling_price => "9.99",
      :renting_price => "9.99",
      :quantity => 1,
      :user => nil
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[photo_data]"

      assert_select "input[name=?]", "item[name]"

      assert_select "input[name=?]", "item[description]"

      assert_select "input[name=?]", "item[selling_price]"

      assert_select "input[name=?]", "item[renting_price]"

      assert_select "input[name=?]", "item[quantity]"

      assert_select "input[name=?]", "item[user_id]"
    end
  end
end
