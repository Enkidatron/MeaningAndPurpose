window.Page = React.createClass
	mixins: [Backbone.React.Component.mixin]
	queries: [
		text: "I have a strong <b>sense of meaning and purpose</b> in life"
		onNumberChange: (event) -> console.log(event.target.value)
		onTextChange: (event) -> console.log(event.target.value)
	,
		text: "I have a clear understanding of <b>what</b> gives my life meaning and purpose"
		onNumberChange: (event) -> console.log(event.target.value)
		onTextChange: (event) -> console.log(event.target.value)
		]
	render: ->
		`<div>
			<Header />
			<div className="container">
				<Quiz questions={this.queries} />
			</div>
			<Footer />
		</div>`
