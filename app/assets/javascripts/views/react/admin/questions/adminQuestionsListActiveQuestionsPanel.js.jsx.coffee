window.AdminQuestionsListActiveQuestionsPanel = React.createClass
	propTypes:
		questions: React.PropTypes.array.isRequired
	render: ->
		questionRows = (`<tr key={question.id} ><td>{question.id}</td><td>{question.question}</td></tr>` for question in this.props.questions)
		`<div className="panel panel-default"> 
			<div className="panel-heading">Active Questions</div>
			<table className="table">
				<tbody>
					{questionRows}
				</tbody>
			</table>
		</div>`