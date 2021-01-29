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
		String email, pw, who;
	
		try {
			request.setCharacterEncoding("UTF-8");

			email = request.getParameter("email");
			pw = request.getParameter("pw");
			who = request.getParameter("who");

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

			PreparedStatement stmt = con.prepareStatement("insert into login values(?,?,?)");
			stmt.setString(1, email);
			stmt.setString(2, pw);
			stmt.setString(3, who);

			stmt.executeUpdate();
			stmt.close();
			con.commit();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("index.jsp");
	%>
</body>
</html>