window.QuestionEditButton = React.createClass
	propTypes:
		question: React.PropTypes.object.isRequired
	getInitialState: ->
		return {show: false, text: this.props.question.question}
	updateQuestionText:  ->
		this.setState
			text: this.refs.input.getValue()
	save: ->
		question = (q for q in MeaningAndPurpose.State.questions.models when q.id == this.props.question.id)[0]
		question.set
			question: this.state.text
		question.save()
		this.setState({show: false})
	close: ->
		this.setState({show: false, text: this.props.question.question})
	open: ->
		this.setState
			show: true
	render: ->
		`<div>
			<rb.Button bsSize="small" bsStyle="info" onClick={this.open}>Edit</rb.Button>
			<rb.Modal show={this.state.show} onHide={this.close}>
				<rb.Modal.Header closeButton>
					<rb.Modal.Title>Edit Question</rb.Modal.Title>
				</rb.Modal.Header>
				<rb.Modal.Body>
					<form>
						<rb.Input type="text" label="Question Text" value={this.state.text} ref='input' onChange={this.updateQuestionText} />
					</form>
				</rb.Modal.Body>
				<rb.Modal.Footer>
					<rb.Button bsStyle="primary" onClick={this.save}>Save</rb.Button>
				</rb.Modal.Footer>
			</rb.Modal>
		</div>`