<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
h2.name {
	color: rgb(107, 236, 98);
}

input.button {
	background: url("image/button.png");
	border: none;
	width: 32px;
	height: 32px;
	background-color: #EAEAEA;
}

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
input.like {
	background: url("image/like.png");
	border: none;
	width: 35px;
	height: 35px;
}
input.dislike {
	background: url("image/dislike.PNG");
	border: none;
	width: 32px;
	height: 32px;
}
</style>
<meta charset="UTF-8">
<title>먹고싶다</title>
</head>
<body>
	<%
		if (session.getAttribute("name") == null) {
			response.sendRedirect("index.jsp");
		}
	%>
	<h2 class="name">삼시세끼</h2>
	<form action="logout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	<table>
		<tr>
			<td>
				<form action="search.jsp">
					<input type="submit" class="button" value="">
					<input type="text" name="search" placeholder="이름을 검색하세요!">
				</form>
			</td>
		</tr>
	</table>
	<br>
	<table border="1">
		<tr class="tatr">
			<th>이름은?</th>
			<th>어떤곳일까?</th>
			<th>좋아요와 싫어요는?</th>
		</tr>
		<%
		try {
			String name, what1, like1, dislike1;
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			Statement stmt = conn.createStatement();
			String query = "select name, what1, like1, dislike1 from list";
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
				<td><form action="like.jsp"><input type="hidden" name="like" value=<%=name %>><input type="submit" class="like" value=""></form><form action="dislike.jsp"><input type="hidden" name="dislike" value=<%=name %>><input type="submit" class="dislike" value=""></form></td>
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
</body>
</html>