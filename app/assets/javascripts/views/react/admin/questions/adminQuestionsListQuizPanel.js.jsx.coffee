window.AdminQuestionsListQuizPanel = React.createClass

	propTypes:
		quizzes: React.PropTypes.array.isRequired
		activeQuizId: React.PropTypes.number.isRequired
		setActiveQuiz: React.PropTypes.func.isRequired
	render: ->
		quizRows = (`<tr className={this.props.activeQuizId===quiz.id ? "info" : ""} key={quiz.id} onClick={this.props.setActiveQuiz(quiz.id)} ><td>{quiz.id}</td><td>{quiz.name}</td></tr>` for quiz in this.props.quizzes)
		# `<div className="row"><div className="col-md-12">
		`<div className="panel panel-default">
			<div className="panel-heading">Quizzes</div>
			<table className="table">
				{quizRows}
			</table>
		</div>`
		# </div></div>`