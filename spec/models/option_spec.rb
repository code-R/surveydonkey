require 'spec_helper'

describe Option do
  accessible_attributes = %w(name question_id)
  subject { Option.new }

  context "Accesible" do
    accessible_attributes.each do |attr|
      it { should be_accessible attr }
    end

    protected_attributes = Option.new.attributes.keys - accessible_attributes

    protected_attributes.each do |attr|
      it { should_not be_accessible attr }
    end
  end

  context "validations" do
    it { should validate_uniqueness_of(:name).scoped_to(:question_id) }
  end

  context "validations" do
    it { should belong_to(:question)}
  end
end
