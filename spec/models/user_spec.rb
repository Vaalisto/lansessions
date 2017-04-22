require 'rails_helper'

RSpec.describe User, type: :model do	
  it "username is set correctly" do
  	user = User.new username:"Kalle"
  	expect(user.username).to eq("Kalle")
  end

  it "not saved without password" do
  	user = User.create username:"Kalle"
  	expect(user).not_to be_valid
  	expect(User.count).to eq(0)
  end

  it "password needs to meet requirements" do
  	user = User.create username: "Kalle", password: "sana", password_confirmation: "sana"
  	expect(user).not_to be_valid
  	expect(User.count).to eq(0)
  end
end
