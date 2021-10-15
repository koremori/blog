require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "without an email" do
      it "is invalid without email" do
        user = build(:user, email: nil, password: "password", password_confirmation: "password")
        expect(user).to be_invalid
      end
    end
    context "duplicate emails" do
      it "is invalid" do
        user = create(:user, email: "test@test.com", password: "123123", password_confirmation: "123123")
        duplicate_user = build(:user, email: "test@test.com", password: "123123", password_confirmation: "123123")
        expect(duplicate_user).to be_invalid
      end
    end
  end
end
