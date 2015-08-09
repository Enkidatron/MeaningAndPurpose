window.UserGraph = React.createClass
	propTypes:
		data: React.PropTypes.array.isRequired
		graphModel: React.PropTypes.object.isRequired
		forceUpdate: React.PropTypes.bool.isRequired
		show: React.PropTypes.string
	chart: null	
	shouldComponentUpdate: (nextProps) ->
		if(this.props.forceUpdate)
			return true
		else if(this.props.show != nextProps.show)
			return true
		else if(this.props.data.length != nextProps.data.length)
			return true
		else if(JSON.stringify(this.props.data) != JSON.stringify(nextProps.data))
			return true
		else 
			return false
	componentDidMount: ->
		this._generateChart()
	componentDidUpdate: ->
# 		if(prevProps.data != this.props.data)
		this._generateChart()
	componentWillUnmount: ->
		this._destroyChart()
	_generateChart: (data) ->
		console.log "_generateChart"
		data = this.props.data
		if this.props.show == "average"
			data = this._getAverageData(data)
		this.chart = c3.generate(
			bindto: "#chart"
			padding:
				right: 30
			data: 
				x: 'x'
				columns: data
			axis:
				x: 
					type: 'timeseries'
					tick:
						format: '%Y-%m-%d'
				y:
					min: 1
					max: 10
			line:
				connectNull: false
			legend:
				item:
					onmouseover: (id) ->
						MeaningAndPurpose.State.graph.set(activeQuestion: id.split(" ")[-1..][0] * 1)
					onmouseout: (id) ->
						MeaningAndPurpose.State.graph.set(activeQuestion: -1)
		)
	_destroyChart: ->
		this.chart.destroy()
	_getAverageData: (data) ->
		return data if data[0].length <= 1
		newdata = []
		newdata[0] = data[0]
		newdata[1] = ["Average"]
		for i in [1...data[0].length]
			sum = 0
			for j in [1...data.length]
				sum += data[j][i]
			newdata[1][i] = sum/(data.length - 1)
		return newdata
	render: ->
		`<div className="row">
			<div className="col-md-12">
				<div id="chart" className="c3"></div>
			</div>
		</div>`