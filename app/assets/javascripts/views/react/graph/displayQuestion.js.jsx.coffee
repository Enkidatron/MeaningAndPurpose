window.DisplayQuestion = React.createClass
	propTypes:
		question: React.PropTypes.object.isRequired
		index: React.PropTypes.number.isRequired
		active: React.PropTypes.bool.isRequired
		answerTexts: React.PropTypes.array.isRequired
	getInitialState: ->
		{
			expanded: false
		}
	toggleExpanded: ->
		this.setState(
			expanded: !this.state.expanded
			)
	render: ->
		answers = if this.state.expanded then (`<AnswerTextWell text={a} key={i} />` for a,i in this.props.answerTexts when a? and a != "") else ""
		panelclassname = if this.props.active then "panel panel-primary" else "panel panel-default"
		`<div className="row"><div className="col-md-12">
			<div className={panelclassname} onClick={this.toggleExpanded} >
				<div className="panel-heading"><h3 className="panel-title">Question {this.props.index + 1}</h3></div>
				<div className="panel-body"><div dangerouslySetInnerHTML={{__html: this.props.question.question}} />
					{answers}
				</div>
			</div>
		</div></div>`