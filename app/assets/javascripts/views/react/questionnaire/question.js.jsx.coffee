window.Question = React.createClass
	propTypes:
		onNumberChange: React.PropTypes.func.isRequired
		onTextChange: React.PropTypes.func.isRequired
		text: React.PropTypes.string.isRequired
	render: ->
		`<div className="row"><div className="col-md-12">
			<div dangerouslySetInnerHTML={{__html: this.props.text}} />
			<QuestionResponse onNumberChange={this.props.onNumberChange} onTextChange={this.props.onTextChange}/>
		</div></div>`

window.QuestionResponse = React.createClass
	propTypes:
		onNumberChange: React.PropTypes.func.isRequired
		onTextChange: React.PropTypes.func.isRequired
	render: ->
		handler = this.props.onNumberChange
		options = (`<option value={num} key={num} onChange={handler} >{num}</option>` for num in [1..10])
		`<div><select onChange={this.props.onNumberChange}>{options}</select><br /><textarea rows="2" onChange={this.props.onTextChange} /></div>`
