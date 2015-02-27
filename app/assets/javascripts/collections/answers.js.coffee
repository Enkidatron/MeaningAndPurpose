class MeaningAndPurpose.Collections.Answers extends Backbone.Collection

  model: MeaningAndPurpose.Models.Answer

  saveAnswers: (response_id) ->
  	console.log 'saveAnswers'
  	# console.log this
  	(answer.set({"response_id": response_id}).saveAnswer() for answer in this.models)
  	