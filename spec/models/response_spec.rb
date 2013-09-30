require 'spec_helper'

describe Response do
  accessible_attributes = %w(answer question_id user_id)
  subject { Response.new }

  context "Accesible" do
    accessible_attributes.each do |attr|
      it { should be_accessible attr }
    end

    protected_attributes = Response.new.attributes.keys - accessible_attributes

    protected_attributes.each do |attr|
      it { should_not be_accessible attr }
    end
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end

end
