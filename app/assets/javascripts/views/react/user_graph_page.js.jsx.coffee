window.UserGraphPage = React.createClass
	mixins: [Backbone.React.Component.mixin]
	propTypes:
		collections: React.PropTypes.object.isRequired
	render: ->
		`<div>
			<Header />
			<div className="container">
				<UserGraph /><GraphQuestionList questions={this.props.collections.questions}/>
			</div>
			<Footer />
		</div>`
