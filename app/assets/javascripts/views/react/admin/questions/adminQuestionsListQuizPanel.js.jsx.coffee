window.AdminQuestionsListQuizPanel = React.createClass

	propTypes:
		quizzes: React.PropTypes.array.isRequired
		activeQuizId: React.PropTypes.number.isRequired
		setActiveQuiz: React.PropTypes.func.isRequired
	createQuiz: ->
		console.log "createQuiz"
		MeaningAndPurpose.State.quizzes.create({version: 1, name: ""})
	render: ->
		quizRows = (`<tr className={this.props.activeQuizId===quiz.id ? "info" : "default"} key={quiz.id} onClick={this.props.setActiveQuiz(quiz.id)} ><td>{quiz.id}</td><td>{quiz.name}</td></tr>` for quiz in this.props.quizzes)
		# `<div className="row"><div className="col-md-12">
		`<div className="panel panel-default">
			<div className="panel-heading">
				Quizzes
				<div className="pull-right"><button className="btn btn-primary btn-sm" onClick={this.createQuiz}>+</button></div>
			</div>
			<table className="table">
				<tbody>
					{quizRows}
				</tbody>
			</table>
		</div>`
		# </div></div>`