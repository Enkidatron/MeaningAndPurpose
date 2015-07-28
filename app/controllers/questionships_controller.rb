class QuestionshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_questionship, only: [:show,:destroy]
	before_action :authenticate_admin!, only: [:create, :destroy]
	# GET /questionships/1
	def show
	end

	# POST /questionships
	def create
		@questionship = Questionship.new(questionship_params)

		respond_to do |format|
			if @questionship.save
				format.html { redirect_to @questionship, notice: 'Questionship was successfully created.'}
				format.json { render :show, status: :created, location: @questionship }
			else
				format.html { redirect_to root_url }
				format.json { render json: @question.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /questionships/1
	def destroy
		@questionship.destroy
		respond_to do |format|
			format.html {redirect_to root_url, notice: 'Questionship was successfully deleted.' }
			format.json { head :no_content }
		end
	end

	private 
		def set_questionship
			@questionship = Questionship.find(params[:id])
		end

		def questionship_params
			params.require(:quiz_id)
			params.require(:question_id)
			params.permit(:quiz_id, :question_id)
		end

		def authenticate_admin!
			unless current_user.admin?
				# TODO: This does not seem to be working. The redirect works, but not the flash
				flash[:error] = "You must be an Admin to view the question list"
				redirect_to root_path
			end
		end

end
