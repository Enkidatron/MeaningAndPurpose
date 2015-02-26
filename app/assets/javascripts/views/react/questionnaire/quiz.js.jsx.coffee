window.Quiz = React.createClass
	propTypes:
		questions: React.PropTypes.object.isRequired
		answers: React.PropTypes.object.isRequired
	render: ->
		questions = (`<Question question={q} answer={this.props.answers.models[i]} key={i}/>` for q,i in this.props.questions.models)
		`<div className="row"><div className="col-md-12">
			<QuizIntro />
			{questions}
			<QuizSubmit answers={this.props.answers} />
		</div></div>`
