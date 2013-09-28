require 'spec_helper'

describe Question do
  subject { Question.new }
  context "Accesible" do
    accesible_attributes = %w(description survey_id type)

    accesible_attributes.each do |attr|
      it { should be_accessible attr }
    end

    protected_attributes = Survey.new.attributes.keys - accesible_attributes

    protected_attributes.each do |attr|
      it { should_not be_accessible attr }
    end
  end
end
