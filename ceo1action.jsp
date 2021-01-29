<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>
</head>
<body>
	<%
		String name, where, what;
	
		try {
			request.setCharacterEncoding("UTF-8");

			name = request.getParameter("name");
			what = request.getParameter("what");

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

			PreparedStatement stmt = con.prepareStatement("insert into list(name, what1) values(?,?)");
			stmt.setString(1, name);
			stmt.setString(2, what);
			
			stmt.executeUpdate();
			stmt.close();
			con.commit();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("success.jsp");
	%>
</body>
</html>