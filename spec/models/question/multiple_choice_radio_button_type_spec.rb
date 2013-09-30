require 'spec_helper'

describe Question::MultipleChoiceRadioButtonType do
  context "#humanized_question_type" do
    it "return humanized question type" do
      build(:multiple_choice_radio_button).humanized_question_type.should == 'Multiple choice via radio button type'
    end

    it "set question type based on RAILS STI" do
      q = Question.new(humanized_question_type: 'multiple_choice_radio_button')
      q.type.should == 'Question::MultipleChoiceRadioButtonType'
    end
  end
end
