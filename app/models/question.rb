class Question < ActiveRecord::Base
	has_many :answers
	has_many :questionships
	has_many :quizzes, through: :questionships
end
