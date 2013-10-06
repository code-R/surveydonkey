class AddDependentOptionAndComparatorToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :dependent_option, :string
    add_column :questions, :comparator, :boolean
  end
end
