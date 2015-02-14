class Response < ActiveRecord::Base
	has_many :answers
	belongs_to :quiz
	belongs_to :user
end
