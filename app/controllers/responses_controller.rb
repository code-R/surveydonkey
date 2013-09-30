class ResponsesController < ApplicationController
  load_and_authorize_resource

  before_filter :fetch_answer_form, only: %w(new create)

  def index
    @survey = Survey.find params[:survey_id]
  end

  def new
  end

  def create
    if @answer_form.submit(params)
      if session[:question_ids].present?
        question_id = session[:question_ids].delete_at 0
        redirect_to new_question_response_path(question_id)
      else
        redirect_to root_path, :notice => 'Survey is completed.'
      end
    else
      render 'new'
    end
  end

  private
    def fetch_answer_form
      question = Question.find params[:question_id]
      form_klass = "Question::#{question.humanized_question_type}TypeForm".constantize
      @answer_form = form_klass.new(question, current_user)
    end
end