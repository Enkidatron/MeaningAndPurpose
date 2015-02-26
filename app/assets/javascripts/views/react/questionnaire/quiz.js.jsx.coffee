window.Quiz = React.createClass
	propTypes:
		questions: React.PropTypes.array.isRequired
	render: ->
		questions = (`<Question text={q.text} onNumberChange={q.onNumberChange} onTextChange={q.onTextChange} key={i}/>` for q,i in this.props.questions)
		`<div className="row"><div className="col-md-12">
			<QuizIntro />
			{questions}
			<QuizSubmit />
		</div></div>`
