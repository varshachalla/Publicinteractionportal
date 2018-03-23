<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="adminNavBar.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin page</title>
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
			<caption>Your Issues are</caption>
			<thead>
				<th>Issue Name</th>
			</thead>
			<tbody>
				<c:forEach items="${adminInbox}" var="issue">
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
											<form enctype="3/20/2018multipart/form-data" action="issueForward.do?issue_id=${issue.issue_id}">
											<div class="form-group">
											<input type="text" name="issue_id" class="hidden" value="${issue.issue_id}">
												<label for="dept-type">Department type</label> <select
													name="dept-type" class="form-control">
													<option value="police-dept">police-dept</option>
													<option value="electricity-dept">electricity-dept</option>
													<option value="municipality-dept">muncipality-dept</option>
												</select>
											</div>
											<div>
												<button type="submit" value="forward"
													class="btn btn-default">Forward</button>
											</div>
											</form>
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
											
											<c:if  test= "${issue.issue_status==4}">
											<h2>Issue deleted </h2>
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

