window.AnswerTextWell = React.createClass
	propTypes:
		text: React.PropTypes.string.isRequired
	render: ->
		`<div className="well well-sm">{this.props.text}</div>`