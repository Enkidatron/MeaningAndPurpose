window.Header = React.createClass
	
	render: ->
		`<nav className="navbar navbar-default"><div className="container">
			<div className="navbar-header">
				<button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse-1">
					<span className="sr-only">Toggle Navigation</span>
					<span className="icon-bar"></span>
					<span className="icon-bar"></span>
					<span className="icon-bar"></span>
				</button>
				<a className="navbar-brand" href="#">Brand</a>
			</div>
			<div className="collapse navbar-collapse" id="app-navbar-collapse-1">
				<ul className="nav navbar-nav navbar-left">
					<li><a href="#">Questionnaire</a></li>
					<li><a href="/graphs/user">Graphs</a></li>
				</ul>
				<ul className="nav navbar-nav navbar-right">
					<li><a href="/users/edit" data-bypass="">Edit Account</a></li>
					<li><a href="/users/sign_out" data-bypass="" data-method="delete">Sign Out</a></li>
				</ul>
			</div>
		</div></nav>`