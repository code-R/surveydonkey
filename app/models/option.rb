class Option < ActiveRecord::Base
  attr_accessible :name, :question_id

  validates_uniqueness_of :name, :scope => :question_id

  belongs_to :question
end
