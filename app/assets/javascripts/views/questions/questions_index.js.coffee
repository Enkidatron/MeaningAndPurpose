class MeaningAndPurpose.Views.QuestionsIndex extends Backbone.View

  template: '<div class="MeaningAndPurpose-container"></div>'
  render: ->
    this.$el.html(this.template)
    pageFactory = React.createFactory(Page)
    page = pageFactory
      collection:
        questions: MeaningAndPurpose.State.questions
        answers: MeaningAndPurpose.State.answers
      model:
        response: MeaningAndPurpose.State.response
    React.render(page, this.$('.MeaningAndPurpose-container').get(0))
    return this
  	
