class MeaningAndPurpose.Views.QuestionsIndex extends Backbone.View

  template: '<div class="MeaningAndPurpose-container"></div>'
  render: ->
  	this.$el.html(this.template)
  	pageFactory = React.createFactory(Page)
  	answerModels = (new MeaningAndPurpose.Models.Answer(question) for question in MeaningAndPurpose.questions.models)
  	answerCollection = new MeaningAndPurpose.Collections.Answers(answerModels)
  	page = pageFactory
  		collection:
  			questions: MeaningAndPurpose.questions
  			answers: answerCollection
  	React.render(page, this.$('.MeaningAndPurpose-container').get(0))
  	return this
  	
