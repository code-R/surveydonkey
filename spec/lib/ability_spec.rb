require 'spec_helper'
require 'cancan/matchers'

describe "User" do
  describe "abilities" do
    subject(:ability){ Ability.new(user) }
    let(:survey) { Survey.new }

    context "guest user" do
      let(:user){ User.new }

      it{ should be_able_to(:index, survey) }
      it{ should_not be_able_to(:manage, survey) }
      it{ should_not be_able_to(:read, survey) }
    end

    context "normal user" do
      let(:user){ create(:user) }

      it{ should be_able_to(:index, survey) }
      it{ should_not be_able_to(:manage, survey) }
      it{ should be_able_to(:read, survey) }
      it{ should be_able_to(:participate, survey) }
      it{ should be_able_to(:create, Response.new) }
    end


    context "admin user" do
      let(:user){ create(:admin) }

      it{ should be_able_to(:all, survey) }
    end
  end
end
