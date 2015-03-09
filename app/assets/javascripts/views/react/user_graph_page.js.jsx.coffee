window.UserGraphPage = React.createClass
	mixins: [Backbone.React.Component.mixin]
	propTypes:
		collection: React.PropTypes.object.isRequired
		model: React.PropTypes.object.isRequired
		answerTexts: React.PropTypes.array.isRequired
	# getInitialState: ->
	# 	return { activeQuestion: -1}
	render: ->
		# console.log 'user graph page render'
		`<div>
			<Header />
			<div className="container">
				<UserGraph /><GraphQuestionList questions={this.state.questions} activeQuestion={this.state.graph.activeQuestion} answerTexts={this.props.answerTexts}/>
			</div>
			<Footer />
		</div>`
