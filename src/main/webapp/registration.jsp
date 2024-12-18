<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>CareNet</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<div class="main">

	<!-- Sign up form -->
	<section class="signup">
		<div class="container">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Sign up</h2>
				
					<form method="post" action="register" class="register-form" id="register-form">
						<div class="form-group">
							<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
							<input type="text" name="name" id="name" placeholder="Your Name" required="required"/>
						</div>
						<div class="form-group">
							<label for="email"><i class="zmdi zmdi-email"></i></label>
							<input type="email" name="email" id="email" placeholder="Your Email" required="required"/>
						</div>
						<div class="form-group">
							<label for="pass"><i class="zmdi zmdi-lock"></i></label>
							<input type="password" name="pass" id="pass" placeholder="Password" required="required" />
						</div>
						<div class="form-group">
							<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
							<input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" required="required"/>
						</div>
						<div class="form-group">
							<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
							<input type="text" name="contact" id="contact" placeholder="Contact no" required="required"/>
						</div>
						<div class="form-group">
							<input type="checkbox" name="agree-term" id="agree-term" class="agree-term" /> 
							<label for="agree-term" class="label-agree-term">
								<span><span></span></span>I agree all statements in 
								<a href="terms.html" class="term-service" target="_blank">Terms of service</a>
							</label>
						</div>
						<div class="form-group form-button">
							<input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
						</div>
					</form>
				</div>
				<div class="signup-image">
					<figure>
						<img src="images/bg1.jpeg" alt="sign up image">
					</figure>
					<a href="login.jsp" class="signup-image-link">I am already member</a>
				</div>
			</div>
		</div>
	</section>

</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">
var status = document.getElementById("status").value;

if(status == "success"){
	swal("Congrats", "Account Created Successfully", "success");
}
else if(status == "invaliduname"){
	swal("Error", "Please Enter Name", "error");
}
else if(status == "invaliduemail"){
	swal("Error", "Please Enter Email", "error");
}
else if(status == "invalidUpwd"){
	swal("Error", "Please Enter Password", "error");
}
else if(status == "invalidconfermpassword"){
	swal("Error", "Password Does Not Match", "error");
}
else if(status == "invalidumobile"){
	swal("Error", "Please Enter Mobile Number", "error");
}
else if(status == "invalidumobilelength"){
	swal("Error", "Mobile Number Should Be Of 10 Digits Only", "error");
}
else if(status == "invalidumobileprefix"){
	swal("Error", "Mobile Number Should Start With 9, 8, 7, or 6 Only", "error");
}

// Validate the form submission
document.getElementById("register-form").addEventListener("submit", function(event) {
    var agreeTerm = document.getElementById("agree-term");
    if (!agreeTerm.checked) {
        event.preventDefault(); // Prevent form submission
        swal("Error", "Please click the terms and conditions checkbox first.", "error");
    }
});
</script>

</body>
</html>
