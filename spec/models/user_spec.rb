require 'rails_helper'

RSpec.describe User, type: :model do
  describe "create" do
    it "generates a username" do
      user = User.create!
      expect(user.username).to(be_truthy)
    end
  end
end
