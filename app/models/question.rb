class Question < ActiveRecord::Base
  attr_accessible :description, :survey_id, :type

  TYPES = %w(date)
end
