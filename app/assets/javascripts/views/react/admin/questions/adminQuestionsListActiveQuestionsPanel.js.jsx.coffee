window.AdminQuestionsListActiveQuestionsPanel = React.createClass
	propTypes:
		questions: React.PropTypes.array.isRequired
		activeQuizId: React.PropTypes.number.isRequired
	deleteQuestionshipHandler: (quiz_id, question_id) ->
		->
			questionship = (q for q in MeaningAndPurpose.State.questionships.models when q.get('quiz_id') == quiz_id and q.get('question_id') == question_id)[0]
			questionship.destroy()
	render: ->
		questionRows = (
			`<tr key={question.id} >
				<td>{question.id}</td>
				<td width="100%">{question.question}</td>
				<td><button className="btn" onClick={this.deleteQuestionshipHandler(this.props.activeQuizId, question.id)}>-</button></td>
			</tr>` for question in this.props.questions)
		`<div className="panel panel-default"> 
			<div className="panel-heading">Active Questions</div>
			<table className="table">
				<tbody>
					{questionRows}
				</tbody>
			</table>
		</div>`