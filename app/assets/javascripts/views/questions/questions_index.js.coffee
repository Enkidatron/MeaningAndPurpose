class MeaningAndPurpose.Views.QuestionsIndex extends Backbone.View

  template: '<div class="MeaningAndPurpose-container"></div>'
  render: ->
  	this.$el.html(this.template)
  	React.renderComponent(new Page(), this.$('.MeaningAndPurpose-container').get(0))
  	return this
  	
