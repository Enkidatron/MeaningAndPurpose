window.AdminQuestionsPage = React.createClass
	mixins: [Backbone.React.Component.mixin]

	render: ->
		`<div>
			<Header />
			<div className="container-fluid">
				<AdminQuestionsList questions={this.state.questions} quizzes={this.state.quizzes} questionships={this.state.questionships} />
			</div>
			<Footer />
		</div>`
