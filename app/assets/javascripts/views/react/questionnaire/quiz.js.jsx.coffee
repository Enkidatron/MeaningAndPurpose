window.Quiz = React.createClass
	mixins: [Backbone.React.Component.mixin]
	propTypes:
		questions: React.PropTypes.array.isRequired
		answers: React.PropTypes.array.isRequired
		responseModel: React.PropTypes.object.isRequired
		answerModels: React.PropTypes.object.isRequired
	render: ->
		questions = (`<Question question={q} answer={this.props.answers[i]} answerModel={this.props.answerModels.models[i]} key={i}/>` for q,i in this.props.questions)
		`<div className="row"><div className="col-md-12">
			<QuizIntro />
			{questions}
			<QuizSubmit response={this.props.responseModel} />
		</div></div>`
