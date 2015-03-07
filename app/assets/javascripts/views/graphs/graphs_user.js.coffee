class MeaningAndPurpose.Views.GraphsUser extends Backbone.View

	template: '<div class="userGraph-container"></div>'
	render: ->
		# console.log 'GraphsUser View render'
		this.$el.html(this.template)
		pageFactory = React.createFactory(UserGraphPage)
		page = pageFactory
			collections:
				questions: MeaningAndPurpose.State.questions
		React.render(page, this.$('.userGraph-container').get(0))
		return this
	renderChart: ->
		# console.log 'backbone renderChart'
		c3.generate(
			bindto: '#chart'
			padding:
				right: 30
			data: 
				x: 'x'
				columns: MeaningAndPurpose.State.user_graph_data
			axis:
				x:
					type: 'timeseries'
					tick:
						format: '%Y-%m-%d'
				y:
					min: 1
					max: 10
			line:
				connectNull: false
			)