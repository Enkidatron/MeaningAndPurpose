window.Page = React.createClass
	mixins: [Backbone.React.Component.mixin]
	render: ->
		`<div class="container"><Header /><Quiz /><Footer /></div>`
