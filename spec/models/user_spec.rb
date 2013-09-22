require 'spec_helper'

describe User do
  it "should create a user with valid attributes" do
    FactoryGirl.create(:user)
  end

  it "should not create user with blank email" do
    user = FactoryGirl.build(:user, email: '')
    user.should_not be_valid
  end

  it "should create user with valid email" do
    user = FactoryGirl.build(:user, email: 'valid_email@example.com')
    user.should be_valid
  end


  it "should not create user with invlaid email" do
    user = FactoryGirl.build(:user, email: 'example.user@foo.')
    user.should_not be_valid
  end

  it "should not create user with duplicate email" do
    FactoryGirl.create(:user)
    user = FactoryGirl.build(:user)
    user.should_not be_valid
  end

  describe "passwords" do
    let(:user) { user = FactoryGirl.build(:user) }

    it "should have a password attribute" do
      user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      user = FactoryGirl.build(:user, password: '', password_confirmation: '')
      user.should_not be_valid
    end

    it "should require a matching password confirmation" do
      user = FactoryGirl.build(:user, password_confirmation: 'something else')
      user.should_not be_valid
    end

    it "should reject short passwords" do
      short_password = 'abcd'
      user = FactoryGirl.build(:user,password: short_password, password_confirmation: short_password)
      user.should_not be_valid
    end
  end

end
