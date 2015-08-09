window.UserGraphPage = React.createClass
	mixins: [Backbone.React.Component.mixin]
	propTypes:
		collection: React.PropTypes.object.isRequired
		model: React.PropTypes.object.isRequired
# 		answerTexts: React.PropTypes.array.isRequired
	# getInitialState: ->
	# 	return { activeQuestion: -1}
	updateGraphMode: (newMode) ->
		->
			MeaningAndPurpose.State.graph.set
				show: newMode
	render: ->
		# console.log 'user graph page render'
		averagestyle = if (this.state.graph.show == "average") then "btn btn-primary" else "btn btn-default"
		allstyle = if (this.state.graph.show == "all") then "btn btn-primary" else "btn btn-default"
		`<div>
			<Header />
			<div className="container">
				<UserGraph data={this.state.graph.data} forceUpdate={this.state.graph.forceUpdate} show={this.state.graph.show} graphModel={this.props.model} />
				<div className="row">
					<div className="col-md-2"><div className="btn-group-vertical" role="group">
						<button type="button" className={averagestyle} onClick={this.updateGraphMode("average")}>Show Average</button>
						<button type="button" className={allstyle} onClick={this.updateGraphMode("all")}>Show All</button>
					</div></div>
					<div className="col-md-10"><div className="well well-sm">
						<p>To see a graph of your responses to individual questions, hover over the legend above. (The text of each question will appear below.)</p>
						<p>To see your text responses, click on questions below.</p>
					</div>
				</div></div>
				<GraphQuestionList questions={this.state.questions} activeQuestion={this.state.graph.activeQuestion} answerTexts={this.state.graph.answerTexts}/>
			</div>
			<Footer />
		</div>`
