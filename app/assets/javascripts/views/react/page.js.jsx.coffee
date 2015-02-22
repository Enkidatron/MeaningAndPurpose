window.Page = React.createClass
	mixins: [Backbone.React.Component.mixin]
	render: ->
		`<div className="container"><Header /><Quiz /><Footer /></div>`
