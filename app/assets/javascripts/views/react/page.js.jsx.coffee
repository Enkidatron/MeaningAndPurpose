window.Page = React.createClass
	mixins: [Backbone.React.Component.mixin]
	propTypes:
		collections: React.PropTypes.object.isRequired
		models: React.PropTypes.object.isRequired
	render: ->
		`<div>
			<Header />
			<div className="container">
				<Quiz questions={this.props.collections.questions} answers={this.props.collections.answers} response={this.props.models.response} />
			</div>
			<Footer />
		</div>`
