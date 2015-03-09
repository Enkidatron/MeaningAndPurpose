window.GraphQuestionList = React.createClass
	propTypes:
		questions: React.PropTypes.array.isRequired
		activeQuestion: React.PropTypes.number.isRequired
	render: ->
		questions = (`<DisplayQuestion question={q} index={i} key={i} active={this.props.activeQuestion==(i+1)} />` for q,i in this.props.questions)
		`<div className="row">
			<div className="col-md-12" >
				{questions}
			</div>
		</div>`