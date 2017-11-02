require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :user => nil,
      :avatar_data => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :sex => "MyString",
      :street => "MyString",
      :postcode => "MyString",
      :state => "MyString",
      :country => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[avatar_data]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[sex]"

      assert_select "input[name=?]", "profile[street]"

      assert_select "input[name=?]", "profile[postcode]"

      assert_select "input[name=?]", "profile[state]"

      assert_select "input[name=?]", "profile[country]"

      assert_select "input[name=?]", "profile[latitude]"

      assert_select "input[name=?]", "profile[longitude]"
    end
  end
end
