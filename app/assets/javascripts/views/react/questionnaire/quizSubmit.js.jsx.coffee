window.QuizSubmit = React.createClass
	propTypes: 
		answers: React.PropTypes.object.isRequired
		response: React.PropTypes.object.isRequired
	handleClick: ->
		# console.log 'submit click'
		this.props.response.saveAllAndRefresh()
		# console.log 'submit click done'
		return null
	render: ->
		`<button className="btn btn-primary" onClick={this.handleClick}>Submit</button>`
