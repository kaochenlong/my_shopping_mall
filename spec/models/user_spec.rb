require 'rails_helper'

RSpec.describe User do
  context "admin user" do
    it "can create a admin user" do
      user = create(:user, :admin)
      expect(user.role).to eq "admin"
    end
  end
end
