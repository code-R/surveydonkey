class ResponsesController < ApplicationController
  load_and_authorize_resource

  def new
    @question = Question.find params[:question_id]
    @response = Response.new(user_id: current_user.id)
  end

  def create
    @response = Response.new(params[:question])

    if @response.save
      if session[:question_ids].present?
        next_question_id = session[:question_ids].delete_at 0
        redirect_to new_question_response_path(next_question_id)
      else
        redirect_to root_path, :notice => 'Survey is completed.'
      end
    else
      render action: 'new'
    end
  end
end