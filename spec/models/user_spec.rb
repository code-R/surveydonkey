require 'spec_helper'

describe User do
  context "Accesible" do
    subject { User.new }

    accessible_attributes = %w(email password password_confirmation remember_me role)

    accessible_attributes.each do |attr|
      it { should be_accessible attr }
    end

    protected_attributes = User.new.attributes.keys - accessible_attributes

    protected_attributes.each do |attr|
      it { should_not be_accessible attr }
    end
  end

  it "should create a user with valid attributes" do
    create(:user)
  end

  it "should not create user with blank email" do
    user = build(:user, email: '')
    user.should_not be_valid
  end

  it "should create user with valid email" do
    user = build(:user, email: 'valid_email@example.com')
    user.should be_valid
  end


  it "should not create user with invlaid email" do
    user = build(:user, email: 'example.user@foo.')
    user.should_not be_valid
  end

  it "should not create user with duplicate email" do
    create(:user, email: 'duplicate@surveydonkey.com')
    user = build(:user, email: 'duplicate@surveydonkey.com')
    user.should_not be_valid
  end

  context "passwords" do
    let(:user) { user = build(:user) }

    it "should have a password attribute" do
      user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      user.should respond_to(:password_confirmation)
    end
  end

  context "password validations" do

    it "should require a password" do
      user = build(:user, password: '', password_confirmation: '')
      user.should_not be_valid
    end

    it "should require a matching password confirmation" do
      user = build(:user, password_confirmation: 'something else')
      user.should_not be_valid
    end

    it "should reject short passwords" do
      short_password = 'abcd'
      user = build(:user,password: short_password, password_confirmation: short_password)
      user.should_not be_valid
    end
  end

  context "#admin?" do
    it "should be false when role is normal" do
      user = create(:user)
      user.should_not be_admin
    end

    it "should be true when role is admin" do
      admin = create(:user, role: 'admin')
      admin.should be_admin
    end
  end

end
