class Response < ActiveRecord::Base
	has_many :answers
	belongs_to :quiz
end
