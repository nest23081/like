<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
<style>
	h2.name {
		color: rgb(107, 236, 98);
	}
	table {
		text-align: center;
		margin: auto;
	}
</style>
</head>
<body>
	<h2 class="name">삼시세끼</h2>
	<table>
		<form action="ceo1action.jsp">
		<tr>
			<td colspan="2"><h3>가게등록</h3></td>
		</tr>
		<tr>
			<td>가게 이름은 무엇인가요?</td>
			<td><input type="text" name="name" placeholder="입력해주세요"></td>
		</tr>
		<tr>
			<td>어떤 곳인가요?</td>
			<td><input type="text" name="what" placeholder="입력해주세요"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="가게등록"></td>
		</tr>
		</form>
	</table>
</body>
</html>