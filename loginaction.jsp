<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		String sql = "select email, count(pw) as cnt, who from login where email=? and pw=? group by email, who";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		rs.next();
		if (rs.getString("cnt").equals("1")) {
			if(rs.getString("email").equals("admin")) {
				session.setAttribute("name", rs.getString("email"));
 				response.sendRedirect("set.jsp");
			}else if(rs.getString("who").equals("ceo")){
				session.setAttribute("name", rs.getString("email"));
 				response.sendRedirect("ceo1.jsp");
			}else {
				session.setAttribute("name", rs.getString("email"));
				response.sendRedirect("success.jsp");
			}

		} else {
			response.sendRedirect("index.jsp");
		}
	} catch (Exception e) {
	}
%>