require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Avatar Data/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
