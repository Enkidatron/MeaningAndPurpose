window.QuizRow = React.createClass
	propTypes: 
		quiz: React.PropTypes.object.isRequired
		setActiveQuiz: React.PropTypes.func.isRequired
		active: React.PropTypes.bool.isRequired
	deleteQuiz: (event) ->
		event.stopPropagation()
		if confirm("Are you REALLY SURE you want to PERMANENTLY DELETE this quiz?")
			quiz = (q for q in MeaningAndPurpose.State.quizzes.models when q.id == this.props.quiz.id)[0]
			quiz.destroy()
			this.props.setActiveQuiz(-1)()
	click: ->
		this.props.setActiveQuiz(this.props.quiz.id)()
	render: ->
		rowclass = if this.props.active then "info" else "default"
		`<tr className={rowclass} key={this.props.quiz.id} onClick={this.click}>
			<td>{this.props.quiz.id}</td>
			<td width="100%">{this.props.quiz.name}</td>
			<td><QuizEditButton quiz={this.props.quiz} /></td>
			<td><rb.Button bsSize="small" bsStyle="danger" onClick={this.deleteQuiz}>Delete</rb.Button></td>
		</tr>`