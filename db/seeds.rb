# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

quiz = Quiz.create({family: 0, version: 1})

questions = quiz.questions.create([{question: "I have a strong <b>sense of meaning and purpose</b> in life", questiontype: 0, family: 0, version: 1},
	{question: "I have a clear understanding of <b>what</b> gives my life meaning and purpose", questiontype: 0, family: 1, version: 1}])

quiz2 = Quiz.create({family: 1, version: 1})
quiz2.questions.create([{question: "another question", questiontype: 0, family: 2, version: 1},
	{question: "question 4", questiontype: 0, family: 2, version: 1}])

user = User.new
user.email = 'test@example.com'
user.encrypted_password = '$2a$10$AdDatvXeeoyezV3N.SgzyuaD87SwprRZeWMdVxuUL67q8rbep15Au'
user.password = 'password'
user.quiz_id = quiz.id
user.save!

[quiz, quiz2].each_with_index do |quiz,i|
	daysago = (3..30).to_a.shuffle.take(10).map{|x| x + (i*30)}
	daysago.each do |d|
		response = Response.create({user_id: user.id, quiz_id: quiz.id})
		response.created_at = d.days.ago
		response.save!
		questions = quiz.questions
		questions.each do |que|
			answer = Answer.create({textAnswer: "", intAnswer: (1..10).to_a.shuffle.take(1).first, response_id: response.id, question_id: que.id})
		end
	end
end
