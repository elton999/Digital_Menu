require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "create a user" do
    it "don't save user without name" do
      user = User.new
      user.email = "john@mail.com"
      user.password = "123456"
      
      expect(user.valid?).to be_falsy  
    end

    it "don't save user without email" do
      user = User.new
      user.name = "john"
      user.password = "123456"
      
      expect(user.valid?).to be_falsy  
    end

    it "don't save user without password" do
      user = User.new
      user.name = "john"
      user.email = "john@mail.com"

      expect(user.valid?).to be_falsy  
    end

    it "save the first user as admin" do
      user = User.new
      user.name = "John"
      user.email = "john@mail.com"
      user.password = "123456"
      
      user.valid?
      user.save
      expect(user.admin && User.all.count == 0).to be User.all.count == 0 
    end
  
  end
  
end
