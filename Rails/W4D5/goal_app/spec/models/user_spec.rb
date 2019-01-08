require 'rails_helper'

RSpec.describe User, type: :model do
  FactoryBot.create(:user)

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }

  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:session_token) }

  describe "::find_by_credentials" do
    if User.find_by(username: "admin").nil?
      u1 = FactoryBot.create(:user, username: "admin", password: "password")
    else
      u1 = User.find_by(username: "admin")
    end

    
    context "with correct info" do
      it "returns expected user" do
        expect(User.find_by_credentials("admin", "password"))
          .to eq(u1)
      end
    end

    context "with incorrect info" do
      it "does not return expected user" do
        expect(User.find_by_credentials("admin", "guess")).not_to eq(u1)
      end
    end
  end
  
end