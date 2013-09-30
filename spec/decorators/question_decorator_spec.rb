require 'spec_helper'

describe QuestionDecorator do
  context ".type_options_for_select" do
    it "should return collection of question types for select box" do
      QuestionDecorator.type_options_for_select.should == [
        %w(Date date),
        %w(Number number),
        %w(Essay essay),
      ]
    end
  end
end
