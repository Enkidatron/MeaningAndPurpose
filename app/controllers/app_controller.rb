class AppController < ApplicationController
  before_action :authenticate_user!

  def home
  	@quiz = current_user.quiz
  	@quiz = Quiz.last if @quiz.nil?
  	@questions = @quiz.questions.shuffle
    @already_submitted = (Response.where(user_id: current_user.id).where("created_at >= ?", Time.zone.now.beginning_of_day).count > 0)
  	gon.rabl unless @questions.nil? or @quiz.nil?
  end
	
	def resources
	end
end
