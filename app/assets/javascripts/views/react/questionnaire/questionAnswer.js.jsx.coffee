window.QuestionAnswer = React.createClass
	propTypes:
		answer: React.PropTypes.object.isRequired
		answerModel: React.PropTypes.object.isRequired
	numberHandler: (event) ->
		# console.log 'numberHandler'
		this.props.answerModel.set({'intAnswer': event.target.value})
	textHandler: (event) ->
		# console.log 'textHandler'
		this.props.answerModel.set({'textAnswer': event.target.value})
	render: ->
		numberHandler = this.numberHandler
		textHandler = this.textHandler
		options = (`<option value={num} key={num} >{num}</option>` for num in [1..10])
		`<div>
			<select onChange={numberHandler} defaultValue={this.props.answer.intAnswer} >{options}</select><br />
			<textarea rows="2" onChange={textHandler} text={this.props.answer.textAnswer}/>
		</div>`
