class TextField extends React.Component {
	constructor(props) {
		super(props);
		this.state = { edit: this.props.edit }
		this.normal = this.normal.bind(this)
		this.handleClick = this.handleClick.bind(this)
		this.handleChange = this.handleChange.bind(this)
	}

	handleClick(e) {
		this.setState({edit: !this.state.edit})
		e.preventDefault()
	}

	handleChange(e) {
		if (e.key === "Enter") {
			const customClass = this.props.customClassname
			this.props.handleChange(customClass, e.target.value)
			this.handleClick(e)
		}
	}

	normal() {
		const CustomTag = this.props.tag
		const customClass = this.props.customClassname
		return(
			<CustomTag 
			  onClick = {this.handleClick} 
			  className = {customClass}
			>
				{this.props.value}
			</CustomTag>
		)
	}

	edit() {
		const CustomTag = this.props.tag

		return(
			<CustomTag>
			<input className="form-control"
			  type='text'
			  defaultValue={this.props.value}
			  onKeyPress={this.handleChange} />
			</CustomTag>
		)
	}

	render() {
		var result = null

		if (this.state.edit) {
			result = this.edit()
		} else {
			result = this.normal()
		}

		return (
			result
		)
	}
}

class Profile extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			name: this.props.object.name,
			email: this.props.object.email
		}
		this.updateState = this.updateState.bind(this)
	}

	updateState(key, value) {
		$.ajax({
			method: "PUT",
			url: "/users/" + this.props.object.id,
			dataType: "JSON",
			data: {
				user: {
					[key]: value
				}
			},
			success: function(data) {
				alert("Success")
				this.setState({[key]: value})
			}.bind(this)
		})
	}

	render() {
		return ( 
			<div>
			<TextField 
				value= {this.state.name} 
				tag="h1" 
				customClassname="name"
				handleChange ={this.updateState} />
			<TextField 
				value= {this.state.email} 
				tag="p" 
				customClassname="email"
				handleChange ={this.updateState} />
			</div>
		)
	}
}

