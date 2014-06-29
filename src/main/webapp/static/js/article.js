function Article() {
	this.no = null;
	this.email = null;
	this.password = null;
	this.body = null;
	this.regtime = null;
	this.modtime = null;
	
	this.setNo = function(no) {
		this.no = no;
	};
	
	this.setEmail = function(email) {
		this.email = email;
	};
	
	this.setBody = function(body) {
		this.body = body;
	};
	
	this.setPassword = function(password) {
		this.password = password;
	};
	
	this.validateEmail = function() {
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.email)) {
			return true;
		} else {
			return false;
		}
	};
}