window.DisplayQuestion = React.createClass
	propTypes:
		question: React.PropTypes.object.isRequired
		index: React.PropTypes.number.isRequired
		active: React.PropTypes.bool.isRequired
	render: ->
		panelclassname = if this.props.active then "panel panel-primary" else "panel panel-default"
		`<div className="row"><div className="col-md-12">
			<div className={panelclassname}>
				<div className="panel-heading"><h3 className="panel-title">Question {this.props.index + 1}</h3></div>
				<div className="panel-body"><div dangerouslySetInnerHTML={{__html: this.props.question.question}} /></div>
			</div>
		</div></div>`