<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" %>
<%
	String name = request.getParameter("name");	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		String query = "delete from list where name=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.executeUpdate();
		response.sendRedirect("set.jsp");
	} catch (Exception e) {
	
	}
%>