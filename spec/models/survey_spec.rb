require 'spec_helper'

describe Survey do
  subject { Survey.new }
  context "Accesible" do
    accessible_attributes = %w(description title)

    accessible_attributes.each do |attr|
      it { should be_accessible attr }
    end

    protected_attributes = Survey.new.attributes.keys - accessible_attributes

    protected_attributes.each do |attr|
      it { should_not be_accessible attr }
    end
  end

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  context "associations" do
    it { should have_many(:questions) }
  end

end
