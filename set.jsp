<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리페이지</title>
<style>
	h2.name {
		color: rgb(107, 236, 98);
	}
	table {
		text-align: center;
		margin: auto;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<%
		if (session.getAttribute("name") == null || !((String)session.getAttribute("name")).equals("admin")) {
			response.sendRedirect("index.jsp");
		}
	%>
	<h2 class="name">삼시세끼</h2>
	<h4>관리페이지</h4>
	<form action="logout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	<center>
		<table border="1">
		<%
		try {
			String name;
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			Statement stmt = conn.createStatement();
			String query = "select name from list";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				name=rs.getString(1);
		%>
			<tr>
				<td><%= name%></td>
				<td><a href="delete.jsp?name=<%=rs.getString("name")%>">삭제</a></td>
			</tr>
		<%
			}
			conn.close();
			stmt.close();
			rs.close();
			} catch (Exception e) {
				out.println(e);
			}
		%>
		</table>
		
	</center>
</body>
</html>