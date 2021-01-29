<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String like = request.getParameter("like");	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

			PreparedStatement stmt = con.prepareStatement("update list set like1=like1+1 where name='"+like+"'");

			stmt.executeUpdate();
			stmt.close();
			con.commit();
			con.close();
			response.sendRedirect("success.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>