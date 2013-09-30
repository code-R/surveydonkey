class QuestionForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :answer
  attr_reader :question, :user

  delegate :description, to: :question

  def self.model_name
    ActiveModel::Name.new(self, nil, 'question_response')
  end

  def initialize(question, user)
    @question = question
    @user = user
  end

  def persisted?
    false
  end

end
