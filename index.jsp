<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<style>
	h2.name{color:rgb(107, 236, 98);}
	h3.a{padding-left: 100px; padding-top: 50px;}
	p.b{padding-left: 100px;}
	a{text-decoration: none;}
	a:link{color: black;}
</style>
</head>
<body>
<h2 class="name">삼시세끼</h2>
<table>
	<tr>
		<td><h3 class="a">원하는 음식점을 찾으세요!</h3>
		<p class="b">원하는 음식점을 찾고 즐기세요!<br>이 곳을 통해 다양한 정보를 얻으실 수 있어요!<br><br><a href="signin.jsp">여기를 눌러 찾으세요!</a></p>
		</td>
		<td rowspan="2">
			<form action="loginaction.jsp">
				<input type="text" name="id" placeholder="이메일" ><br><br>
				<input type="password" name="pw" placeholder="비밀번호"><br><br>
				<input type="submit" value="로그인">
			</form>
		</td>
	</tr>
	<tr>
		<td><h3 class="a">사장님들도 도와주세요!</h3>
		<p class="b">사장님들도 가게를 등록하여 모두에게 자신의 가게를 홍보할 수 있어요!<br><br><a href="signin.jsp">여기를 눌러 도와주세요!</a></p>
		</td>
	</tr>
</table>

</body>
</html>