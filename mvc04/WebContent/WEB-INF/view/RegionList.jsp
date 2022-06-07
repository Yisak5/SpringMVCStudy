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
<title>RegionList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".updateBtn").click(function()
		{
			$(location).attr("href", "regionupdateform.action?regionId=" + $(this).val());
			
		});
		
		$(".deleteBtn").click(function()
		{
			$(location).attr("href", "regiondelete.action?regionId=" + $(this).val());
		});
	});

</script>

</head>
<body>

	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<div id="content">
		
		<h1>[ 지역 목록 (관리자 전용) ]</h1>
		<hr>
		<div>
			<form>
				<input type="button" value="지역 추가" class="btn"
				onclick="location.href='regioninsertform.action'">
				<!-- onclick="location.href='EmployeeInsertForm.jsp'"> -->
			</form>
		</div>
		
		<br><br>
		<!---------------------------------------------------------------
		REGIONID REGIONAME 
		----------------------------------------------------------------->
		<table id="customers" class="table">
			<tr>
				<th>지역번호</th>
				<th>지역이름</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			
			<c:forEach var="region" items="${regionList }">
			<tr>
				<td>${region.regionId }</td>
				<td>${region.regionName }</td>
				<td>
				<button type="button" class="btn updateBtn"
				value="${region.regionId }&regionName=${region.regionName}">수정</button>
				</td>
				<td>
				<button type="button" class="btn deleteBtn"
				value="${region.regionId }">삭제</button>
				</td>
			</tr>
			</c:forEach>
			
			<!-- 
			<tr>
				<td>1</td>
				<td>개발부</td>
			</tr>
			 -->
			 
			 
		</table>
		
		
	</div>
	
	<div id="fotter">
	
	</div>
	
</body>
</html>