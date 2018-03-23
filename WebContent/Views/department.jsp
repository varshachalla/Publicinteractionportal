<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file= "DeparmentNavBar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Department Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<H1 align="center">Issues List</H1>
	<table class="table table-striped">
		<caption>Your Inbox:</caption>
		<thead>
			<th>Issue Name</th>
		</thead>
		<tbody>
			<c:forEach items= "${departmentInbox}" var="issue">
				<tr>
					<td>${issue.issue_name}</td>
					<td><button type="button" class="btn btn-danger btn-lg" id="openBtn data-id=${issue.issue_id}"data-toggle="modal" data-target="#myModal${issue.issue_id}" >open</button>
				</tr>
				<!-- Modal -->
						<div id="myModal${issue.issue_id}" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">${issue.issue_name}</h4>
										<h4 class="modal-desc">${issue.issue_desc}</h4>
										<h4 class="modal-date">${issue.issue_date}</h4>
									</div>
									<div class="modal-body">
									
									<c:if  test= "${issue.issue_status_name != 'pending'}">
											<h2>Issue Status is :  ${issue.issue_status_name}</h2>
									</c:if>
									
										<form enctype="3/20/2018multipart/form-data" action="issueStatusUpdate.do?issue_id=${issue.issue_id}">
											<div class="form-group">
											<input type="text" name="issue_id" class="hidden" value="${issue.issue_id}">
												<label for="status">Status</label> <select
													name="status" class="form-control">
													<option value="in-progress">in-progress</option>
													<option value="completed">completed</option>
													<option value="deleted">delete</option>
												</select>
											</div>
											<div>
												<button type="submit" value="forward"
													class="btn btn-default">Change Status</button>
											</div>
										</form>
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