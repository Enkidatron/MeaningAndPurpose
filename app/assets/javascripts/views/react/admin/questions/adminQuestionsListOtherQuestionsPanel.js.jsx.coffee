window.AdminQuestionsListOtherQuestionsPanel = React.createClass
	propTypes:
		questions: React.PropTypes.array.isRequired
		activeQuizId: React.PropTypes.number.isRequired
	createQuestionshipHandler: (quiz_id, question_id) ->
		->
			MeaningAndPurpose.State.questionships.create({quiz_id: quiz_id, question_id: question_id})
	createQuestionRow: (question) ->
		if this.props.activeQuizId != -1 
			addButton = `<button className="btn" onClick={this.createQuestionshipHandler(this.props.activeQuizId, question.id)} >+</button>`
		else
			addButton = ''
		`<tr key={question.id} ><td>{question.id}</td><td width="100%">{question.question}</td><td>{addButton}</td></tr>`
	render: ->
		questionRows = (this.createQuestionRow(question) for question in this.props.questions)
		`<div className="panel panel-default">
			<div className="panel-heading">Other Questions</div>
			<table className="table">
				<tbody>
					{questionRows}
				</tbody>
			</table>
		</div>`