<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="home.do">Public Interaction Portal</a>
    </div>
    <button class="btn btn-danger navbar-btn" id="complainBtn">Log complain</button>
	<!-- Modal -->
	  <div class="modal fade" id="complainModal" role="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div class="modal-content">
	      <div class="modal-header" style="padding:35px 50px;">
	      <h1><b>&nbsp;&nbsp;Post a complaint</b></h1>

				<h:form method="post" action="login.do" enctype="multipart/form-data">
					<div class="col-md-6 form-line">
			  			<div class="form-group">
			  				<label for="dept-type">Department type</label>
					    	<select name="dept-type" class="form-control">
									<option value="police-dept">police-dept</option>
									<option value="electricity-dept">electricity-dept</option>
									<option value="muncipality-dept">muncipality-dept</option>
							</select>
				  		</div>
				  		<div class="form-group">
					    	<label for="description">Description</label>
					    	<textarea rows="10" cols="50" class="form-control" id="description" placeholder=" write description"></textarea>
					  	</div>
					  	 <div class="form-group">
                             <label for="image" class="col-md-3 control-label">Image</label><br>
                                <input name="image" type="file" onchange="previewFile()"><br>
								<img src="" height="200" >
								<script>
   								function previewFile(){
							       var preview = document.querySelector('img'); //selects the query named img
							       var file    = document.querySelector('input[type=file]').files[0]; //sames as here
							       var reader  = new FileReader();
							
							       reader.onloadend = function () {
							           preview.src = reader.result;
							       }
							
							       if (file) {
							           reader.readAsDataURL(file); //reads the data as a URL
							       } else {
							           preview.src = "";
							       }
							  	}
							
							  	previewFile();  //calls the function named previewFile()
							  	</script>
							               
       					</div> 
       
         				<div  class="form-group">
                        <!-- Button -->
                        <div class="col-sm-12 controls">
                             <button type="submit" form="form1" value="Submit" class="btn btn-info">Submit</button>
                             <button type="reset" value="Reset" class="btn btn-danger">Reset</button>

                       </div>
                       </div>  	
			  		</div> 		
			  	</h:form>
			  	</div>
			  	</div>
			  	</div>
			  	</div>
			  	
	<script>
	$(document).ready(function(){
	    $("#complainBtn").click(function(){
	        $("#complainModal").modal();
	    });
	});
	</script>
    <button class="btn btn-danger navbar-btn">Issues</button>
    <button class="btn btn-danger navbar-btn" id="regBtn" style="float: right;">Register</button>
	 <!-- Modal -->
	  <div class="modal fade" id="regModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header" style="padding:35px 50px;">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4><span class="glyphicon glyphicon-lock"></span>Register</h4>
	        </div>
	        <div class="modal-body" style="padding:40px 50px;">
	          <!--hereherehere-->
	          
	          <form role="form" action="register" method="post">
	           <div class="form-group">
	              <label for="email"><span class="glyphicon glyphicon-user"></span>Email</label>
	              <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
	            </div>
	            <div class="form-group">
	              <label for="username"><span class="glyphicon glyphicon-user"></span>Username</label>
	              <input type="text" class="form-control" id="username" name="username" placeholder="Enter email">
	            </div>
	            <div class="form-group">
	              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Password</label>
	              <input type="password" class="form-control" id="psw" name="psw" placeholder="Enter password">
	            </div>
	           <div class="form-group">
	              <label for="re-psw"><span class="glyphicon glyphicon-eye-open"></span>Re-enter Password</label>
	              <input type="password" class="form-control" id="re-psw" name="re-psw" placeholder="Re-enter password">
	            </div>
	            <div class="form-group">
                                <label for="dept-type" class=""><span class="glyphicon glyphicon-eye-open"></span>Department type</label>
                                <br>
                                <div class="col-md-9">
                                    <select name="dept-type" class="form-control">
									<option value="police-dept">police-dept</option>
									<option value="electricity-dept">electricity-dept</option>
									<option value="muncipality-dept">muncipality-dept</option>
									</select>
                                </div>
                </div>
	            <div class="form-group">
	            <br>
	              <label for="dept_id"><span class="glyphicon glyphicon-eye-open"></span>Dept-Id</label>
	              <input type="text" class="form-control" id="dept_id" name="dept_id" placeholder="Department id">
	            </div>
	       		<div class="form-group">
                                <label for="area" class=""><span class="glyphicon glyphicon-eye-open"></span>Area</label>
                                <br>
                                <div class="col-md-9">
                                    <select name="area" class="form-control">
									<option value="hyderabad">Hyderabad</option>
								
									</select>
                                </div>
                                </div>
                <div class="form-group">
                				<br>
                                 <label for="dept-image" class=""><span class="glyphicon glyphicon-eye-open"></span>Image</label>
                                  <br>
                                <input type="file" name="dept-image" onchange="previewFile()"><br>
								<img src="" height="200" >
								<script>
   								function previewFile(){
							       var preview = document.querySelector('img'); //selects the query named img
							       var file    = document.querySelector('input[type=file]').files[0]; //sames as here
							       var reader  = new FileReader();
							
							       reader.onloadend = function () {
							           preview.src = reader.result;
							       }
							
							       if (file) {
							           reader.readAsDataURL(file); //reads the data as a URL
							       } else {
							           preview.src = "";
							       }
							  }
							
							  previewFile();  //calls the function named previewFile()
							  </script>
							               
       							 </div> 
       
                
	            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Register</button>
	          </form>
	          
	        </div>  
	        </div>
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
	        </div>
	      </div>
	      
	   
	  </div> 
	  <script>
	$(document).ready(function(){
	    $("#regBtn").click(function(){
	        $("#regModal").modal();
	    });
	});
	</script>
	<button class="btn btn-danger navbar-btn" id="loginBtn" style="float: right;">Login</button>
	  <!-- Modal -->
	  <div class="modal fade" id="loginModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header" style="padding:35px 50px;">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
	        </div>
	      <div class="modal-body" style="padding:40px 50px;">
	      <form action="login.do" method="POST">
	           <div class="form-group">
	             <label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
	             <input type="text" class="form-control" name ="username" id="username" placeholder="Enter email">
	           </div>
	           <div class="form-group">
	             <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
	             <input type="text" class="form-control" name ="psw" id="psw" placeholder="Enter password">
	           </div>
	           <div class="checkbox">
	             <label><input type="checkbox" value="" checked>Remember me</label>
	           </div>
	              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
	          </form>
	        </div>
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
	          <p>Forgot <a href="#">Password?</a></p>
	        </div>
	      </div>
	      
	    </div>
	 
	<script>
	$(document).ready(function(){
	    $("#loginBtn").click(function(){
	        $("#loginModal").modal();
	    });
	});
	</script>
</div>
</div>   
</nav>
</body>
</html>
    