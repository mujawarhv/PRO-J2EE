<%@page import="com.cdac.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.cdac.serv.UserServiceImple"%>
<%@page import="com.cdac.serv.UserService"%>
<%@ page  language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="no-cache-page.jsp" %>    
 <%
 	User loggedUser = (User)session.getAttribute("user");
 	if(loggedUser !=null && loggedUser.getUserName()!=null){
 	UserService userService = new UserServiceImple();
 	List<User> ulist = userService.userList();
 %> 
 
 
 
 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3 style="text-align: right;" ><a href="logout.jsp" >Log Out</a></h3>
	<table align="center" style="background-color: gray;color: #ffffff" >
			<%
				for(User u : ulist){
			%>
	
			<tr style="text-align: center;">
				<td><%=u.getUserId() %></td>
				<td><%=u.getUserName() %></td>
				<td><%=u.getUserPass() %></td>
				<td><%=u.getUserRole() %></td>
				<td><a href="user_delete.jsp?userId=<%=u.getUserId()%>" >Delete</a></td>
				<td><a href="user_select.jsp?userId=<%=u.getUserId()%>" >Select</a></td>
			</tr>
			
			<% } %>
			
		</table>
</body>
</html>
<% }else{
response.sendRedirect("logout.jsp");	
}
	%>
