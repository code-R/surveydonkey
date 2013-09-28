class Question < ActiveRecord::Base
  attr_accessible :description, :survey_id, :type

  TYPES = %w(date)

  validates :description, :type, :survey_id, presence: true
end
