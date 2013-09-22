require 'spec_helper'

describe Survey do
  context "Accesible" do
    subject { Survey.new }

    accesible_attributes = %w(description title)

    accesible_attributes.each do |attr|
      it { should be_accessible attr }
    end

    protected_attributes = Survey.new.attributes.keys - accesible_attributes

    protected_attributes.each do |attr|
      it { should_not be_accessible attr }
    end
  end

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

end
