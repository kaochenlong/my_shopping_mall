require 'rails_helper'

RSpec.describe ExampleUser do
  describe "add users" do
    context "normal user" do
      it "can add a new example user" do
        u = create(:example_user, :dad)
        expect(ExampleUser.count).to be 1
      end
    end

    context "random user" do
      it "can add a random user, but user will be unavailable" do
        u = create(:example_user)
        expect(u.is_available).to be false
        expect(ExampleUser.count).to be 0  # is_available = false don't count
      end
    end
  end
end
