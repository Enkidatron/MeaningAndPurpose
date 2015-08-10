window.AdminQuestionsListActiveQuestionsPanel = React.createClass
	propTypes:
		questions: React.PropTypes.array.isRequired
		activeQuizId: React.PropTypes.number.isRequired
	deleteQshipHandler: (question_id) ->
		quiz_id = this.props.activeQuizId
		->
			questionship = (q for q in MeaningAndPurpose.State.questionships.models when q.get('quiz_id') == quiz_id and q.get('question_id') == question_id)[0]
			questionship.destroy()
	render: ->
		questionRows = (`<QuestionRow question={question} action={this.deleteQshipHandler(question.id)} actionText="-" key={question.id} />` for question in this.props.questions)
		panelheader=`<div>Active Questions</div>`
		`<rb.Panel header={panelheader}> 
			<rb.Table fill>
				<tbody>
					{questionRows}
				</tbody>
			</rb.Table>
		</rb.Panel>`