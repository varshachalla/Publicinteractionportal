<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" href="admin.do">Public Interaction Portal</a>
    <button class="btn btn-danger navbar-btn" id="inbox" onClick="inbox()" >Inbox</button>
    <button class="btn btn-danger navbar-btn" id="manage">Manage</button>
    <button class="btn btn-danger navbar-btn" id="report">Report Generation</button>
    </div>
     <button class="btn btn-danger navbar-btn" id="logout" onClick="logout()" style="float: right;">Logout</button>
     </div>
    </nav>
    <script>
    function logout()
    {
    	window.location="logout.do";
    	
    }
    
    function inbox()
    {
    	window.location="admin.do";
    	
    }
    </script>

</body>
</html>