require 'rails_helper'

describe ExampleUser do
  it "can add a new example user" do
    u = FactoryGirl.create(:my_dad)
    expect(ExampleUser.count).to be 1
  end

  it "can add a random user, but user will be unavailable" do
    u = FactoryGirl.create(:random_user)
    expect(u.is_available).to be false
    expect(ExampleUser.count).to be 0  # is_available = false don't count
  end
end
