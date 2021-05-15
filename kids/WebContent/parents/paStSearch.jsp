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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		function searchCheck(){
			
			var name = document.paform.name.value;
			var hp = document.paform.hp.value;
			
			if(name.length() <1){
				console.log('name if문 들어옴');
				alert('이름을 1글자 이상 입력하세요');
				document.paform.name.focus();
				return false;
			}else if(hp.lenghth() <3){
				console.log('hp if문 들어옴');
				alert('휴대폰을 3글자 이상 입력하세요');
				document.paform.name.focus();
				return false;
			}
		}
		
		function sendSid(sid){
			alert('sendSid');
			opener.writeform.sid.value = sid;
			window.close();
		}
	</script>
</head>
<body>
	<header class="border-bottom-secondary">
		<form name="paform" action="<%=YesForm%>" method="post">
			&nbsp;<input type="hidden" name="command" value="paStSearch">
			<input type="text" name="name" id="name" placeholder="이름">
			<input type="number" name="hp" id="hp" placeholder="휴대폰">
			<button class="btn btn-primary" type="submit" onclick="searchCheck();">검색</button>
		</form>
	</header>
	<div>
		<a href="#" onclick="sendSid('${requestScope.sid}');">${requestScope.sid}</a>
	</div>
</body>
</html>