window.QuizSubmit = React.createClass
	propTypes: 
		answers: React.PropTypes.object.isRequired
	handleClick: ->
		this.props.answers.saveAnswers
		console.log 'saved answers'
	render: ->
		`<button className="btn btn-primary" onClick={this.handleClick}>Submit</button>`
