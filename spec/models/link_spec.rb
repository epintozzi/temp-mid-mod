require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is invalid without url" do
      link = Link.create(title: "Google")
      expect(link).to be_invalid
    end
    it "is invalid without title" do
      link = Link.create(url: "http://www.google.com")
      expect(link).to be_invalid
    end
    it "is valid with all attributes" do
      link = Link.create(url: "http://www.google.com", title: "Google")
      expect(link).to be_valid
    end
  end
end
