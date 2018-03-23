<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file= "firstPageNav.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Issues</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>

	<div class="container">
		<H1 align="center">Issues List</H1>
		<table class="table table-striped">
			<thead>
				<th>Issue Name</th>
			</thead>
			<tbody>
				<c:forEach items="${issueInbox}" var="issue">
					<tr>
						<td>${issue.issue_name}</td>
						
						<td><button type="button" class="btn btn-danger btn-lg" id="openBtn data-id=${issue.issue_id}"data-toggle="modal" data-target="#myModal${issue.issue_id}" style="float: right;">open</button>
						</td>
					</tr>
					<!-- Modal -->
						<div id="myModal${issue.issue_id}" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h2 class="modal-title">${issue.issue_name}</h2>
										<h3 class="modal-desc">${issue.issue_desc}</h3>
										<h3 class="modal-date">${issue.issue_date}</h3>
									</div>
									<div class="modal-body">
										
											<img src="/${issue.issue_image}.png" alt="issue image" width="500" height="600">
											<c:if  test= "${issue.issue_status==0 || issue.issue_status==-1}">
											<h2>Issue Pending </h2>
											</c:if>
											
											<c:if  test= "${issue.issue_status==1}">
											<h2>Issue forwarded to :  ${issue.dept_name} </h2>
											</c:if>
											
											<c:if  test= "${issue.issue_status==2}">
											<h2>Issue in-progress under :  ${issue.dept_name} </h2>
											</c:if>
											
											<c:if  test= "${issue.issue_status==3}">
											<h2>Issue resolved by :  ${issue.dept_name} </h2>
											</c:if>
											
											
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</div>

							</div>
						</div>
					
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

