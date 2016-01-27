require 'rails_helper'

describe User do
  # homework
  context "admin user" do
    user = create(:admin)
    expect(user.role).to eq "admin"
  end
end
