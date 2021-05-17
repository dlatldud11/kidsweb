<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/Kids" ;
	
	String YesForm = contextPath + mappingName ;
	String NoForm = contextPath + mappingName + "?command=" ;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>학생 찾기</title>
	<link href="<%=contextPath %>/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for thiscontextPath template -->
    <link href="<%=contextPath  %>/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
	<script type="text/javascript">
		
		function meclose(){
			var sid = "${requestScope.bean.sid}";
			var site = porder;
			opener.writeForm.sid.value = sid;
			
			var win = window.open("","_self");
			win.close();
		}
		
	   window.onload = function(){
		   var order = '${requestScope.order}';
		   var porder = '';=
		   if(order == 'f'){
			  
		   }else if(order == 's'){
			   
		   }else if(order == 't'){
			   
		   }
	   }
	</script>
</head>
<body>
	<header class="border-bottom-secondary">
		<form name="paform" action="<%=YesForm%>" method="get">
			&nbsp;<input type="hidden" name="command" value="paStSearch">
			<input type="text" name="name" id="name" placeholder="이름" value="${requestScope.bean.name }" required>
			<input type="text" name="hp" id="hp" placeholder="휴대폰 번호(***********)" value="${requestScope.bean.hp }" required>
			<button class="btn btn-primary" type="submit" onclick="return searchCheck();">검색</button>
		</form>
	</header> 
	<body>
		<p align="center">학생 아이디 : ${requestScope.bean.sid}</p>
		<div align="center">
			<button onclick="meclose();">
				적용
			</button>
		</div>
	</body>
</body>
</html>