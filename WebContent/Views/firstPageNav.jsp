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
	      </div>
	      <div class="modal-body" style="padding:40px 50px;">
				<form method="post" action="complain.do" enctype="multipart/form-data">
					
			  			<!--<div class="form-group">
			  				<label for="dept-type">Department type</label>
					    	<select name="dept-type" class="form-control">
									<option value="police-dept">police-dept</option>
									<option value="electricity-dept">electricity-dept</option>
									<option value="muncipality-dept">muncipality-dept</option>
							</select>
				  		</div>	 -->
				  		<div class="form-group">
					    	<label for="issue-name">Issue</label>
							<input type="text" class="form-control" id="issue-name" name="issue-name" placeholder="Enter issue">
					  	</div>
				  		<div class="form-group">
					    	<label for="description">Description</label>
					    	<textarea rows="10" cols="50" class="form-control" name="description" id="description" placeholder=" write description"></textarea>
					  	</div>
       					<!--  delete from -->
       					
			            <div class="form-group">
			                <span class="input-group-btn">

			                     <!-- image-preview-filename input [CUT FROM HERE]-->
            <font color="red">${error}</font>
      		<font color="green">${message}</font>
            <div class="input-group image-preview">
            
                <input type="text" class="form-control image-preview-filename hidden" disabled="disabled"> 
                
                <span class="input-group-btn">
                    <!-- image-preview-clear button -->
                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                        <span class="glyphicon glyphicon-remove"></span> Clear
                    </button>
                    <!-- image-preview-input -->
                    <div class="btn btn-default image-preview-input">
                        <span class="glyphicon glyphicon-folder-open"></span>
                        <span class="image-preview-input-title">Browse</span>
                        <input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/>
                    </div>
                </span>
            </div><!-- /input-group image-preview [TO HERE]--> 
			                </span>
            			</div><!-- /input-group image-preview [TO HERE]--> 
       					<!--  delete to -->
         				<div  class="form-group">
                        <!-- Button -->
                        
                             <button type="submit" value="Submit" class="btn btn-info">Submit</button>
                             <button type="reset" value="Reset" class="btn btn-danger">Reset</button>

                       
                       </div>  	
			  			
			  	</form>
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
	
	$(document).on('click', '#close-preview', function(){ 
	    $('.image-preview').popover('hide');
	    // Hover befor close the preview
	    $('.image-preview').hover(
	        function () {
	           $('.image-preview').popover('show');
	        }, 
	         function () {
	           $('.image-preview').popover('hide');
	        }
	    );    
	});

	$(function() {
	    // Create the close button
	    var closebtn = $('<button/>', {
	        type:"button",
	        text: 'x',
	        id: 'close-preview',
	        style: 'font-size: initial;',
	    });
	    closebtn.attr("class","close pull-right");
	    // Set the popover default content
	    $('.image-preview').popover({
	        trigger:'manual',
	        html:true,
	        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
	        content: "There's no image",
	        placement:'bottom'
	    });
	    // Clear event
	    $('.image-preview-clear').click(function(){
	        $('.image-preview').attr("data-content","").popover('hide');
	        $('.image-preview-filename').val("");
	        $('.image-preview-clear').hide();
	        $('.image-preview-input input:file').val("");
	        $(".image-preview-input-title").text("Browse"); 
	    }); 
	    // Create the preview image
	    $(".image-preview-input input:file").change(function (){     
	        var img = $('<img/>', {
	            id: 'dynamic',
	            width:250,
	            height:200
	        });      
	        var file = this.files[0];
	        var reader = new FileReader();
	        // Set preview image into the popover data-content
	        reader.onload = function (e) {
	            $(".image-preview-input-title").text("Change");
	            $(".image-preview-clear").show();
	            $(".image-preview-filename").val(file.name);            
	            img.attr('src', e.target.result);
	            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
	        }        
	        reader.readAsDataURL(file);
	    });  
	});
	
	 function issues()
	    {
	    	window.location="issues";
	    	
	    }
	</script>
    <button class="btn btn-danger navbar-btn" onClick="issues()">Issues</button>
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
									<option value="1">police-dept</option>
									<option value="2">electricity-dept</option>
									<option value="3">muncipality-dept</option>
									</select>
                                </div>
                </div>
	            <div class="form-group">
	            <br>
	              <label for="dept_id"><span class="glyphicon glyphicon-eye-open"></span>Dept authentication Id</label>
	              <input type="text" class="form-control" id="dept_id" name="dept_id" placeholder="Department authentication id">
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
	             <input type="password" class="form-control" name ="psw" id="psw" placeholder="Enter password">
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
    