require 'spec_helper'

describe QuestionDecorator do
  context ".type_options_for_select" do
    it "should return collection of question types for select box" do
      QuestionDecorator.type_options_for_select.should == [
        ['Date type', 'date'],
        ['Number type', 'number'],
        ['Essay type', 'essay'],
        ['Multiple choice via radio button type', 'multiple_choice_radio_button']
      ]
    end
  end
end
