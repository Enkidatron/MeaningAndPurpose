window.GraphQuestionList = React.createClass
	propTypes:
		questions: React.PropTypes.object.isRequired
	render: ->
		questions = (`<DisplayQuestion question={q} index={i} key={i}/>` for q,i in this.props.questions.models)
		`<div className="row">
			<div className="col-md-12" >
				{questions}
			</div>
		</div>`