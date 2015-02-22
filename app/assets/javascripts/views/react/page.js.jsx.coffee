window.Page = React.createClass
	mixins: [Backbone.React.Component.mixin]
	render: ->
		`<div><Header /><Quiz /><Footer /></div>`
