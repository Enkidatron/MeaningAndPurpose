window.UserGraphPage = React.createClass
	mixins: [Backbone.React.Component.mixin]
	# propTypes:
	# 	collections: React.PropTypes.object.isRequired
	# 	models: React.PropTypes.object.isRequired
	# getInitialState: ->
	# 	return { activeQuestion: -1}
	render: ->
		# console.log 'user graph page render'
		`<div>
			<Header />
			<div className="container">
				<UserGraph /><GraphQuestionList questions={this.state.questions} activeQuestion={this.state.graph.activeQuestion}/>
			</div>
			<Footer />
		</div>`
