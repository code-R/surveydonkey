class QuestionForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :answer, :question, :user

  validates :answer, :question, :user, presence: true

  delegate :description, :is_required?, :children, to: :question

  def self.model_name
    ActiveModel::Name.new(self, nil, 'question_response')
  end

  def initialize(question, user)
    @question = question
    @user = user
  end

  def submit(params)
    self.answer = params[:question_response][:answer]
    if self.valid?
      response = Response.create!(answer: answer, question_id: question.id, user_id: user.id)
      true
    else
      false
    end
  end

  def persisted?
    false
  end

  def valid?
    return true unless is_required?
    super
  end

  def dependent_questions
    self.children.dependent_questions(answer)
  end

end
