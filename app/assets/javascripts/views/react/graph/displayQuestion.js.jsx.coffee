window.DisplayQuestion = React.createClass
	propTypes:
		question: React.PropTypes.object.isRequired
		index: React.PropTypes.number.isRequired
	render: ->
		`<div className="row"><div className="col-md-12">
			<div className="panel panel-default">
				<div className="panel-heading"><h3 className="panel-title">Question {this.props.index + 1}</h3></div>
				<div className="panel-body"><div dangerouslySetInnerHTML={{__html: this.props.question.get("question")}} /></div>
			</div>
		</div></div>`