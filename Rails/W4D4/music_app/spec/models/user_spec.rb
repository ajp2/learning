require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  u1 = User.create(email: "test", password: "hello")

  describe "validation" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "#is_password?" do
    # u1 = User.new(email: "test", password: "hello")

    it "should return true if passwords match" do
      expect(u1.is_password?("hello")).to be true
    end

    it "should return false if passwords don't match" do
      expect(u1.is_password?("bye")).to be false
    end
  end

  describe "#reset_session_token!" do
    # u1 = User.create(email: "test", password: "hello")

    it "changes user's session token" do
      before = u1.session_token
      after = u1.reset_session_token!
      expect(u1.session_token).not_to eq(before)
      expect(u1.session_token).to eq(after)
      expect(before).not_to eq(after)
    end
  end

  describe "::find_by_credentials" do
    it "should return user if given valid email and password" do
      u2 = User.create(email: "abc", password: "abc123")
      expect(User.find_by_credentials("abc", "abc123")).to eq(u2)
    end
  end
end
