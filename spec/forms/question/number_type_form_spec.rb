require 'spec_helper'

describe Question::NumberTypeForm do
  let(:question) { create(:number_question) }
  let(:user) { create(:user) }
  subject { Question::NumberTypeForm.new(question, user) }

  context "#validations" do
    it "should return true if answer is valid number" do
      subject.submit(question_response: {answer: 123}).should be
    end

    it "should return false if answer is invalid number" do
      subject.submit(question_response: {answer: 'some answer'}).should_not be
    end
  end

  it "returns input type as datepicker" do
    subject.input_type.should == 'numeric'
  end

end
