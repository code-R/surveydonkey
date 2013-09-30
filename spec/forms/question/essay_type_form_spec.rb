require 'spec_helper'

describe Question::EssayTypeForm do
  let(:question) { create(:number_question) }
  let(:user) { create(:user) }
  subject { Question::EssayTypeForm.new(question, user) }

  it "returns input type as textarea" do
    subject.input_type.should == 'text'
  end

end
