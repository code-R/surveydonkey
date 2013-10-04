require 'spec_helper'

describe QuestionForm do
  let(:question) { create(:date_question) }
  let(:user) { create(:user) }
  subject { QuestionForm.new(question, user) }

  context "validations" do
    before { QuestionForm.any_instance.should_receive(:is_required?).at_least(1).times.and_return(true) }

    it { should validate_presence_of :question }
    it { should validate_presence_of :user }
    it { should validate_presence_of :answer }
  end

  context "#valid?" do
    it "should skip validations if the question is marked as optional" do
      subject.should_not be_valid
    end
  end

  context "#description" do
    it "returns question description" do
      subject.description.should == question.description
    end
  end

  context "#submit" do
    it "returns false if question_form is invalid" do
      subject.submit(question_response: {}).should_not be
    end

    it "returns true if question_form is valid" do
      subject.submit(question_response: {answer: 'some answer'}).should be
    end
  end

  context "#persisted?" do
    it "returns false for table less model" do
      subject.should_not be_persisted
    end
  end

  context ".model_name" do
    it "returns 'question_response'" do
      QuestionForm.model_name.should == 'question_response'
    end
  end

end
