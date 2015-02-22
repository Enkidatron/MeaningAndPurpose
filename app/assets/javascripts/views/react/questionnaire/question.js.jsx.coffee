window.Question = React.createClass
	render: ->
		`<div className="row"><div className="col-md-12"><div dangerouslySetInnerHTML={{__html: this.props.text}} /><QuestionResponse /><hr /></div></div>`

window.QuestionResponse = React.createClass
	render: ->
		`<div><p>QuestionResponse</p></div>`
