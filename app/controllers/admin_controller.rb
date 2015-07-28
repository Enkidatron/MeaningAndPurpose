class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!

	def questions
		@questions = Question.all
		@quizzes = Quiz.all
		@questionships = Questionship.all
	end

	private
	def authenticate_admin!
		unless current_user.admin?
			# TODO: This does not seem to be working. The redirect works, but not the flash
			flash[:error] = "You must be an Admin to view the question list"
			redirect_to root_path
		end
	end
end
