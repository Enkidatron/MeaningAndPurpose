class MeaningAndPurpose.Views.GraphsUser extends Backbone.View

	template: '<div class="userGraph-container"></div>'
	render: ->
		# console.log 'GraphsUser View render'
		this.$el.html(this.template)
		pageFactory = React.createFactory(UserGraphPage)
		page = pageFactory
			collection:
				questions: MeaningAndPurpose.State.questions
			model:
				graph: MeaningAndPurpose.State.graph
			answerTexts: MeaningAndPurpose.State.user_text_data
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
			legend:
				item:
					onmouseover: (id) ->
						MeaningAndPurpose.State.graph.set({activeQuestion: id.split(" ")[-1..][0] * 1})
					onmouseout: (id) ->
						MeaningAndPurpose.State.graph.set({activeQuestion: -1})
			)