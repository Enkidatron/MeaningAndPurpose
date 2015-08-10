window.AdminQuestionsListOtherQuestionsPanel = React.createClass
	propTypes:
		questions: React.PropTypes.array.isRequired
		activeQuizId: React.PropTypes.number.isRequired
	createQshipHandler: (question_id) ->
		quiz_id = this.props.activeQuizId
		if quiz_id != -1
			->
				MeaningAndPurpose.State.questionships.create({quiz_id: quiz_id, question_id: question_id})
		else
			->
				return null
	createQuestion: ->
		MeaningAndPurpose.State.questions.create({version: 1, question: "New Question"})
	render: ->
		questionRows = (`<QuestionRow question={question} action={this.createQshipHandler(question.id)} actionText="+" key={question.id} />` for question in this.props.questions)
		panelheader = `<div>Other Questions<div className="pull-right"><rb.Button bsSize="small" bsStyle="primary" onClick={this.createQuestion}>New Question</rb.Button></div></div>`
		`<rb.Panel header={panelheader}>
			<rb.Table fill>
				<tbody>
					{questionRows}
				</tbody>
			</rb.Table>
		</rb.Panel>`