window.QuizEditButton = React.createClass
	PropTypes:
		quiz: React.PropTypes.object.isRequired
	getInitialState: ->
		return {show: false, text: this.props.quiz.name}
	updateText: ->
		this.setState
			text: this.refs.input.getValue()
	save: ->
		quiz = (q for q in MeaningAndPurpose.State.quizzes.models when q.id == this.props.quiz.id)[0]
		quiz.set
			name: this.state.text
		quiz.save()
		this.setState({show: false})
	close: ->
		this.setState({show: false, text: this.props.quiz.name})
	open: ->
		this.setState
			show: true
	render: ->
		`<div>
			<rb.Button bsSize="small" bsStyle="info" onClick={this.open}>Edit</rb.Button>
			<rb.Modal show={this.state.show} onHide={this.close}>
				<rb.Modal.Header closeButton>
					<rb.Modal.Title>Edit Quiz</rb.Modal.Title>
				</rb.Modal.Header>
				<rb.Modal.Body>
					<form>
						<rb.Input type="text" label="Quiz Name" value={this.state.text} ref="input" onChange={this.updateText} />
					</form>
				</rb.Modal.Body>
				<rb.Modal.Footer>
					<rb.Button bsStyle="primary" onClick={this.save}>Save</rb.Button>
				</rb.Modal.Footer>
			</rb.Modal>
		</div>`