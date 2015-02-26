class MeaningAndPurpose.Collections.Answers extends Backbone.Collection

  model: MeaningAndPurpose.Models.Answer

  saveAnswers: ->
  	(answer.saveAnswer for answer in this.models)
  	