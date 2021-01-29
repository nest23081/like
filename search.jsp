<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head></head>
<meta charset="UTF-8">
<title>검색완료</title>
<style>
	tr.tatr th {
	color: #6799FF;
	}

	table {
		text-align: center;
		margin: auto;
		border-collapse: collapse;
		border-right: none;
		border-left: none;
	}
	h2.name {
		color: rgb(107, 236, 98);
	}
</style>
</head>
<body>
	<h2 class="name">삼시세끼</h2>
	<table border="1">
	<tr class="tatr">
			<th>이름은?</th>
			<th>어떤곳일까?</th>
			<th>좋아요와 싫어요는?</th>
	</tr>
	<%
	try {
		String name, what1, like1, dislike1, search;
		request.setCharacterEncoding("UTF-8");
		search=request.getParameter("search");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		Statement stmt = conn.createStatement();
		String query = "select name, what1, like1, dislike1 from list where name like '%" + search + "%'";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			name=rs.getString(1);
			what1=rs.getString(2);
			like1=rs.getString(3);
			dislike1=rs.getString(4);
	%>
		<tr>
			<td><%= name%></td>
			<td><%= what1%></td>
			<td><%= like1%> / <%= dislike1%></td>
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
	<a href="javascript:history.back()" style="display:scroll;position:fixed;bottom:20px;right:20px;" title="back"><img src="image/back.png" height="45px" width="45px"></a>
</body>
</html>