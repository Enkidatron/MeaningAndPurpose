window.GraphQuestionList = React.createClass
	propTypes:
		questions: React.PropTypes.array.isRequired
		activeQuestion: React.PropTypes.number.isRequired
		answerTexts: React.PropTypes.array.isRequired
	getInitialState: ->
		return {
			height: window.innerHeight - (50+1+20 + 1 + 320 + 100)
			scrollTop: 0
		}
	handleResize: (e) ->
		this.setState(
			height: window.innerHeight - (50+1+20 + 1 + 320 + 100)
		)
	componentDidMount: ->
		window.addEventListener('resize', this.handleResize)
	componentWillUnmount: ->
		window.removeEventListener('resize', this.handleResize)
	componentDidUpdate: ->
		if (this.props.activeQuestion >= 0)
			node = this.getDOMNode()
			node.scrollTop = node.children[0].children[this.props.activeQuestion-1].offsetTop
	render: ->
		questions = (`<DisplayQuestion question={q} index={i} key={i} active={this.props.activeQuestion==(i+1)} answerTexts={this.props.answerTexts[i]} />` for q,i in this.props.questions)
		`<div className="row" style={{overflowY: "scroll", height: this.state.height}}>
			<div className="col-md-12" >
				{questions}
			</div>
		</div>`