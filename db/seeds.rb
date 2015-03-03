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

