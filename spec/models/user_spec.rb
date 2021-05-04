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
        @user1 = User.new(
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
end

#2. Define validation specs
# Make sure password and password_confirmation match 
# Email must be unique, case_sensitiviy doesnt matter
# first name and last name should also be required 

#3. Password minimu length 

#4. New authentication (class) method 
