require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is invalid without email" do
      user = User.create(password: "password", password_confirmation: "password")
      expect(user).to be_invalid
    end

    it "is invalid if email is not unique" do
      create(:user)
      user = User.create(email: "email@example.com", password: "password", password_confirmation: "password")
      expect(user).to be_invalid
    end

    it "is invalid without password" do
      user = User.create(email: "email@example.com")
      expect(user).to be_invalid
    end

    it "is valid with all attributes" do
      user = User.create(email: "email@example.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end
  end
end
