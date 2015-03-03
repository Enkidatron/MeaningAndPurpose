class Quiz < ActiveRecord::Base
	has_many :responses
	has_many :questionships
	has_many :questions, through: :questionships
	has_many :users
end
