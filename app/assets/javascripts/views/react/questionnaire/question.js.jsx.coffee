window.Question = React.createClass
	propTypes:
		question: React.PropTypes.object.isRequired
		answer: React.PropTypes.object.isRequired
	render: ->
		`<div className="row"><div className="col-md-12">
			<div dangerouslySetInnerHTML={{__html: this.props.question.get("question")}} />
			<QuestionAnswer answer={this.props.answer}/>
		</div></div>`

window.QuestionAnswer = React.createClass
	propTypes:
		answer: React.PropTypes.object.isRequired
	numberHandler: (event) ->
		console.log 'numberHandler'
		this.props.answer.set({'intAnswer': event.target.value})
	textHandler: (event) ->
		# console.log 'textHandler'
		this.props.answer.set({'textAnswer': event.target.value})
	render: ->
		numberHandler = this.numberHandler
		textHandler = this.textHandler
		options = (`<option value={num} key={num} >{num}</option>` for num in [1..10])
		`<div>
			<select onChange={numberHandler} defaultValue={this.props.answer.get("intAnswer")} >{options}</select><br />
			<textarea rows="2" onChange={textHandler} text={this.props.answer.get("textAnswer")}/>
		</div>`
