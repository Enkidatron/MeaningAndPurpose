class MeaningAndPurpose.Views.GraphsUser extends Backbone.View

	template: '<p>hello</p><div id="chart"></div>'
	render: ->
		console.log 'GraphsUser View render'
		this.$el.html(this.template)
		return this
	renderChart: ->
		c3.generate({
			bindto: '#chart'
			data: 
				columns: [
					['data1',1,2,3,4,5],
					['data2',6,7,8,9,4]
				]
			})