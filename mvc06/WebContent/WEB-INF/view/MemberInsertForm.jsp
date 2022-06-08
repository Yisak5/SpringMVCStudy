<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<form action="memberinsert.action">
		<table>
			<tr>
				<th>아이디</th> 
				<td><input type="text" id="id" name="id"/></td>
			</tr>
			<tr>
				<th>비밀번호</th> 
				<td><input type="password" id="pw" name="pw"/></td>
			</tr>
			<tr>
				<th>이름</th> 
				<td><input type="text" id="name" name="name"/></td>
			</tr>
			<tr>
				<th>전화번호</th> 
				<td><input type="text" id="tel" name="tel"/></td>
			</tr>
			<tr>
				<th>이메일</th> 
				<td><input type="text" id="email" name="email"/></td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="submit" value="입력"/>
				<input type="reset" value="취소"/>
				</th>
			</tr>
			<tr>
				<th>
					<a href="memberlist.action">명단으로</a>
				</th>
			</tr>
		</table>
	</form>
</div>

</body>
</html>