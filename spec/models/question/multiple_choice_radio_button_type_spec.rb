require 'spec_helper'

describe Question::MultipleChoiceRadioButtonType do
  context "#humanized_question_type" do
    it "return humanized question type" do
      build(:multiple_choice_radio_button_question).humanized_question_type.should == 'Multiple choice via radio button type'
    end

    it "set question type based on RAILS STI" do
      q = Question.new(qtype: 'multiple_choice_radio_button')
      q.type.should == 'Question::MultipleChoiceRadioButtonType'
    end
  end

  context "associations" do
    it { should have_many(:options).with_foreign_key('question_id').dependent(:destroy) }
  end
end
