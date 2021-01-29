<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
	h2.name{color:rgb(107, 236, 98);}
	div.a{text-align: center;}
	table.ta td{padding: 15px;}
</style>
<script>
	function check(){
		if(fun.pw.value!=fun.pwc.value){
			alert("비밀번호가 일치하지 않아요!!!")
			fun.pwc.focus();
			return false;
		}
		if(fun.email.value==""){
			alert("이메일을 알려주세요!!!")
			fun.email.focus();
			return false;
		}
		if(fun.pw.value==""){
			alert("비밀번호를 알려주세요!!!")
			fun.pw.focus();
			return false;
		}
		if(fun.who.value=="no"){
			alert("누구신지 선택하세요!!!")
			return false;
		}
		fun.submit();
	}
</script>
</head>
<body>
<h2 class="name">삼시세끼</h2>
<div class="a">
	<h3>회원가입</h3>
	<br>
	<form action="signinaction.jsp" name="fun">
		<table align="center" class="ta">
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" placeholder="이메일을 입력해주세요"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" placeholder="비밀번호를 입력해주세요"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwc" placeholder="다시 한 번 입력해주세요"></td>
			</tr>
			<tr>
				<td>누구신가요?</td>
				<td>
					<select name="who">
						<option value="no">선택하세요</option>
						<option value="user">둘러보는 사람?</option>
						<option value="ceo">사장님?</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" onclick="check()" value="회원가입"></td>
			</tr>	
		</table>
	</form>
</div>
</body>
</html>