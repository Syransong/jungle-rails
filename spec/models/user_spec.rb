require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    context "given all required input fields: name, email, password and password confirmation" do
      it "should save successfully" do
        @user = User.new(
          name: "Jason Mason",
          email: "jason@mason.com",
          password: "stone",
          password_confirmation: "stone"
        )
        expect(@user).to be_valid
      end

      it "should have a matching password and password confirmation" do
        @user = User.new(
          name: "Jason Mason",
          email: "jason@mason.com",
          password: "stone",
          password_confirmation: "henge"
        )
        expect(@user.password).to_not be_equal(@user.password_confirmation)
      end

      it "should have a password with a minimum length of 3" do
        @user = User.new(
          name: "Jason Mason",
          email: "jason@mason.com",
          password: "ro",
          password_confirmation: "ro"
        )
        expect(@user).to_not be_valid
      end
    end

    context "given the following input fields: name, email, and password" do
      it "should require password confirmation" do
        @user = User.new(
          name: "Jason Mason",
          email: "jason@mason.com",
          password: "stone",
          password_confirmation: nil
        )
        expect(@user).to_not be_valid
      end
    end

    context "given the following input fields: email, password and password confirmation" do
      it "should require a name" do
        @user = User.new(
          name: nil,
          email: "jason@mason.com",
          password: "stone",
          password_confirmation: "stone"
        )
        expect(@user).to_not be_valid
      end
    end

    context "verify inputted email:" do
      before do
        @user1 = User.create(
          name: "Jason Mason",
          email: "jason@mason.com",
          password: "stone",
          password_confirmation: "stone"
        )
      end

      it "should be unique i.e. not saved before in the database" do
        @user2 = User.new(
          name: "Carter Baker",
          email: "jason@mason.com",
          password: "dough",
          password_confirmation: "dough"
        )
        expect(@user2).to_not be_valid
      end
      
      it "should be unique and case sensitivity does not matter" do
        @user2 = User.new(
          name: "Carter Baker",
          email: "JASON@mason.com",
          password: "dough",
          password_confirmation: "dough"
        )
        expect(@user2).to_not be_valid
      end
    end
  end  

  describe ".authenticate_with_credentials" do
    before do
      @user = User.create(
        name: "Jason Mason",
        email: "jason@mason.com",
        password: "stone",
        password_confirmation: "stone"
      )
    end
    
    it "should log in user that has the correct password" do
      authenticate = User.authenticate_with_credentials("jason@mason.com", "stone")
      expect(authenticate).to eql(@user)
    end

    it "should still log in user if the email has whitespace" do
      authenticate = User.authenticate_with_credentials("    jason@mason.com    ", "stone")
      expect(authenticate).to eql(@user)
    end

    it "should still log in user if the email is in the wrong case" do
      authenticate = User.authenticate_with_credentials("JaSoN@mAsOn.com", "stone")
      expect(authenticate).to eql(@user)
    end

    it "should NOT log in user if the password is not in the right case" do
      authenticate = User.authenticate_with_credentials("JaSoN@mAsOn.com", "stONe")
      expect(authenticate).to eql(nil)
    end
  end
end

