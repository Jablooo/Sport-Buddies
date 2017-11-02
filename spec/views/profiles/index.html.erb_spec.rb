require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user => nil,
        :avatar_data => "Avatar Data",
        :first_name => "First Name",
        :last_name => "Last Name",
        :sex => "Sex",
        :street => "Street",
        :postcode => "Postcode",
        :state => "State",
        :country => "Country",
        :latitude => 2.5,
        :longitude => 3.5
      ),
      Profile.create!(
        :user => nil,
        :avatar_data => "Avatar Data",
        :first_name => "First Name",
        :last_name => "Last Name",
        :sex => "Sex",
        :street => "Street",
        :postcode => "Postcode",
        :state => "State",
        :country => "Country",
        :latitude => 2.5,
        :longitude => 3.5
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Avatar Data".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
