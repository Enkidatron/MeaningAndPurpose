window.Page = React.createClass
	mixins: [Backbone.React.Component.mixin]
	# propTypes:
	# 	collections: React.PropTypes.object.isRequired
	# 	models: React.PropTypes.object.isRequired
	render: ->
		if this.props.already_submitted
			el = `<QuizPlaceholder />` 
		else
			el = `<Quiz questions={this.state.questions} answers={this.state.answers} responseModel={this.props.model.response} answerModels={this.props.collection.answers} />`
		`<div>
			<Header />
			<div className="container">
				{el}
			</div>
			<Footer />
		</div>`
