<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="menubar.jsp" %>
	<br><br><br><br><br><br><br>
	<h1 align="center" style="color:black"><%= message %></h1>
	<br><br><br><br><br>
	<div style="text-align:center">
		<button type="button" onclick="home();" style="width:100px; height:30px;">Home</button>
	</div>
	
	<script>
		
		function home(){
			location.href="<%= request.getContextPath()%>";
		}
	</script>

</body>
</html>


