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
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div class="wrap">
	<div class="header">
		<div class="header_logo" style="text-align: center;">
			<h1>COMFIT</h1>
		</div>
		<div class="header_search">
			<input type="text" placeholder="검색어를 입력해주세요" id="search_bar">
			<button style="width: 80px; height: 30px;">검색</button>
		</div>
		<div class="header_login">
			<button style="width: 80px; height: 50px;">로그인</button>
			<button>회원가입</button>
			<button>고객센터</button>
		</div>
	</div>
	
	<div class="content">
		<p>content</p>
		
	</div>
	
	<div class="fotter">
		<p>fotter</p>
	</div>
</div>


</body>
</html>