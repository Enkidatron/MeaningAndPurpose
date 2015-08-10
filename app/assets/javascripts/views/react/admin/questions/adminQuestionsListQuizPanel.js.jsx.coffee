window.AdminQuestionsListQuizPanel = React.createClass

	propTypes:
		quizzes: React.PropTypes.array.isRequired
		activeQuizId: React.PropTypes.number.isRequired
		setActiveQuiz: React.PropTypes.func.isRequired
	createQuiz: ->
		MeaningAndPurpose.State.quizzes.create({version: 1, name: "New Quiz"})
	render: ->
		quizRows = (`<QuizRow quiz={quiz} setActiveQuiz={this.props.setActiveQuiz} active={this.props.activeQuizId == quiz.id} key={quiz.id} />` for quiz in this.props.quizzes)
		panelheader = `<div>Quizzes<div className="pull-right"><rb.Button bsSize="small" bsStyle="primary" onClick={this.createQuiz}>New Quiz</rb.Button></div></div>`
		`<rb.Panel header={panelheader}>
			<rb.Table fill>
				<tbody>
					{quizRows}
				</tbody>
			</rb.Table>
		</rb.Panel>`