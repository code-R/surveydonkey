require 'spec_helper'
require 'cancan/matchers'

describe "User" do
  describe "abilities" do
    subject(:ability){ Ability.new(user) }

    context "guest user" do
      let(:user){ User.new }

      it{ should be_able_to(:index, Survey.new) }
      it{ should_not be_able_to(:manage, Survey.new) }
      it{ should_not be_able_to(:read, Survey.new) }
    end

    context "normal user" do
      let(:user){ FactoryGirl.create(:user) }

      it{ should be_able_to(:index, Survey.new) }
      it{ should_not be_able_to(:manage, Survey.new) }
      it{ should be_able_to(:read, Survey.new) }
    end


    context "admin user" do
      let(:user){ FactoryGirl.create(:admin) }

      it{ should be_able_to(:all, Survey.new) }
    end
  end
end
