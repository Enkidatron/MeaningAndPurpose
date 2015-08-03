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
				<UserGraph />
				<div className="row"><div className="col-md-12"><div className="well well-sm">
					<p>To see a graph of your responses to individual questions, hover over the legend above. (The text of each question will appear below.)</p>
					<p>To see your text responses, click on questions below.</p>
				</div></div></div>
				<GraphQuestionList questions={this.state.questions} activeQuestion={this.state.graph.activeQuestion} answerTexts={this.props.answerTexts}/>
			</div>
			<Footer />
		</div>`
