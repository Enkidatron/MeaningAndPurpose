window.QuestionRow = React.createClass
	propTypes:
		question: React.PropTypes.object.isRequired
		action: React.PropTypes.func.isRequired
		actionText: React.PropTypes.string.isRequired
	deleteQuestion: ->
		if confirm("Are you REALLY SURE you want to PERMANENTLY DELETE this question?")
			question = (q for q in MeaningAndPurpose.State.questions.models when q.id = this.props.question.id)[0]
			question.destroy()
	render: ->
		`<tr key={this.props.question.id} >
			<td>{this.props.question.id}</td>
			<td width="100%">{this.props.question.question}</td>
			<td><QuestionEditButton question={this.props.question} /></td>
			<td><rb.Button onClick={this.deleteQuestion} bsSize="small" bsStyle="danger">Delete</rb.Button></td>
			<td><rb.Button onClick={this.props.action} bsSize="small" bsStyle="primary">{this.props.actionText}</rb.Button></td>
		</tr>`