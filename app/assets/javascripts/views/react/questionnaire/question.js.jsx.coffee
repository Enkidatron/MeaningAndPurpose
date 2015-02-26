window.Question = React.createClass
	propTypes:
		question: React.PropTypes.object.isRequired
		answer: React.PropTypes.object.isRequired
	numberHandler: (event) ->
		this.props.answer.set({'intAnswer': event.target.value})
	textHandler: (event) ->
		this.props.answer.set({'textAnswer': event.target.value})
	render: ->
		numberHandler = this.numberHandler
		textHandler = this.textHandler
		`<div className="row"><div className="col-md-12">
			<div dangerouslySetInnerHTML={{__html: this.props.question.get("question")}} />
			<QuestionAnswer onNumberChange={numberHandler} onTextChange={textHandler}/>
		</div></div>`

window.QuestionAnswer = React.createClass
	propTypes:
		onNumberChange: React.PropTypes.func.isRequired
		onTextChange: React.PropTypes.func.isRequired
	render: ->
		handler = this.props.onNumberChange
		options = (`<option value={num} key={num} onChange={handler} >{num}</option>` for num in [1..10])
		`<div><select onChange={this.props.onNumberChange}>{options}</select><br /><textarea rows="2" onChange={this.props.onTextChange} /></div>`
