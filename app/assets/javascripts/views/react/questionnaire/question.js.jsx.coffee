window.Question = React.createClass
	mixins: [Backbone.React.Component.mixin]
	propTypes:
		question: React.PropTypes.object.isRequired
		answer: React.PropTypes.object.isRequired
		answerModel: React.PropTypes.object.isRequired
	render: ->
		`<div className="row"><div className="col-md-12">
			<div dangerouslySetInnerHTML={{__html: this.props.question.question}} />
			<QuestionAnswer answer={this.props.answer} answerModel={this.props.answerModel} />
		</div></div>`

