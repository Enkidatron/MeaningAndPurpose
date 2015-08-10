window.AdminQuestionsList = React.createClass
	
	propTypes:
		quizzes: React.PropTypes.array.isRequired
		questions: React.PropTypes.array.isRequired
		questionships: React.PropTypes.array.isRequired
	getInitialState: ->
		return {
			activeQuizId: -1
		}
	setActiveQuizHandler: (id) ->
		self = this
		->
			self.setState(
				activeQuizId: id
			)
	render: ->
		activeQuestionIds = (questionship.question_id for questionship in this.props.questionships when questionship.quiz_id == this.state.activeQuizId)
		activeQuestions = (question for question in this.props.questions when question.id in activeQuestionIds)
		otherQuestions = (question for question in this.props.questions when question.id not in activeQuestionIds)
		`<div className="row">
			<div className="col-md-4"><AdminQuestionsListQuizPanel quizzes={this.props.quizzes} activeQuizId={this.state.activeQuizId} setActiveQuiz={this.setActiveQuizHandler} /></div>
			<div className="col-md-8">
				<div className="row"><div className="col-md-12">
					<AdminQuestionsListActiveQuestionsPanel questions={activeQuestions} activeQuizId={this.state.activeQuizId} />
				</div></div>
				<div className="row"><div className="col-md-12">
					<AdminQuestionsListOtherQuestionsPanel questions={otherQuestions} activeQuizId={this.state.activeQuizId} />
				</div></div>
			</div>
		</div>`
		