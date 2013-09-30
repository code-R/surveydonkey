require 'spec_helper'

describe Question::DateTypeForm do
  let(:question) { create(:date_question) }
  let(:user) { create(:user) }
  subject { Question::DateTypeForm.new(question, user) }

  it "returns input type as datepicker" do
    subject.input_type.should == 'date_picker'
  end

  context "validations" do
    it "should return true if answer is valid date" do
      subject.submit(question_response: {answer: Date.today.to_s}).should be
    end

    it "should return false if answer is invalid date" do
      subject.submit(question_response: {answer: 'some answer'}).should_not be
    end
  end

end
