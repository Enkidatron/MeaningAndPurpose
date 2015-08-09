class MeaningAndPurpose.Routers.Router extends Backbone.Router
	routes:
		"(#)graphs(/user)(/)": "user_graph"
		"(#)": "quiz"
		"(#)admin/questions(/)": "admin_questions"
		"resources": "resources"
	resources: ->
# 		console.log('router.resources')
		return null
	quiz: ->
# 		console.log 'router.quiz'
		# Set Application State
		# Get user_id, Quiz, and Questions from gon
		unless gon? and gon.questions? and gon.quiz? and gon.already_submitted?
			$.ajax("/app/home.json", {success: (result, status, xhr) ->
				# console.log 'router.quiz ajax'
				window.gon = result
				MeaningAndPurpose.router.init_quiz()
			})
		else
			this.init_quiz()
			gon = null
	user_graph: ->
# 		console.log 'router.user_graph'
		unless gon? and gon.questions? and gon.data? and gon.textData?
			$.ajax("/graphs/user.json", {success: (result, status, xhr) ->
				window.gon = result
				MeaningAndPurpose.router.init_user_graph()
			})
		else
			this.init_user_graph()
			gon = null
	admin_questions: ->
		unless gon? and gon.admin_questions? and gon.admin_quizzes? and gon.admin_questionships?
			$.ajax("/admin/questions.json", {success: (result, status, xhr) ->
				window.gon = result
				MeaningAndPurpose.router.init_admin_questions()
			})
		else
			this.init_admin_questions() 
			gon = null
	init_quiz: ->
		# console.log 'init_quiz'
		MeaningAndPurpose.State.questions = new MeaningAndPurpose.Collections.Questions(gon.questions)
		MeaningAndPurpose.State.quiz = new MeaningAndPurpose.Models.Quiz(gon.quiz)
		MeaningAndPurpose.State.user_id = gon.current_user.id
		MeaningAndPurpose.State.already_submitted = gon.already_submitted
		# Match the response to the quiz
		MeaningAndPurpose.State.response = new MeaningAndPurpose.Models.Response()
		MeaningAndPurpose.State.response.set("quiz_id", MeaningAndPurpose.State.quiz.get("id"))
		MeaningAndPurpose.State.response.set("user_id", MeaningAndPurpose.State.user_id)
		# Create an answer for each question
		answerFactory = (question_id) ->
			answer = new MeaningAndPurpose.Models.Answer()
			answer.set({"question_id": question_id})
			answer
		answerModels = (answerFactory(question.get("id")) for question in MeaningAndPurpose.State.questions.models)
		MeaningAndPurpose.State.answers = new MeaningAndPurpose.Collections.Answers(answerModels)
		# Make the Quiz view
		pageView = new MeaningAndPurpose.Views.QuestionsIndex {}
		$('body').html(pageView.render().$el)
	init_user_graph: ->
		# Get state from gon
		MeaningAndPurpose.State.questions = new MeaningAndPurpose.Collections.Questions(gon.questions)
# 		MeaningAndPurpose.State.user_graph_data = gon.data
# 		MeaningAndPurpose.State.user_text_data = gon.textData
		MeaningAndPurpose.State.graph = new MeaningAndPurpose.Models.UserGraph
			activeQuestion: -1
			data: gon.data
			answerTexts: gon.textData
			forceUpdate: false
			show: "average"
		userGraphView = new MeaningAndPurpose.Views.GraphsUser {}
		$('body').html(userGraphView.render().$el)
		# now we need to update the model, which will cause the React components to re-render
		# If we were pure React, the graph would have rendered the first time, but because
		# the React rendering is inside of Backbone rendering, we need to do this
		MeaningAndPurpose.State.graph.set
			forceUpdate: true
		MeaningAndPurpose.State.graph.set
			forceUpdate: false
	init_admin_questions: ->
		MeaningAndPurpose.State.questions = new MeaningAndPurpose.Collections.Questions(gon.admin_questions)
		MeaningAndPurpose.State.quizzes = new MeaningAndPurpose.Collections.Quizzes(gon.admin_quizzes)
		MeaningAndPurpose.State.questionships = new MeaningAndPurpose.Collections.Questionships(gon.admin_questionships)
		adminQuestionsView = new MeaningAndPurpose.Views.AdminQuestions {}
		$('body').html(adminQuestionsView.render().$el)