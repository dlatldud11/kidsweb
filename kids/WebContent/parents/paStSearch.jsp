<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>학생 찾기</title>
	<link href="<%=request.getContextPath() %>/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script type="text/javascript">
		function searchCheck(){
			alert('searchCheck');
			
			var name = document.paform.name.value;
			var hp = document.paform.hp.value;
			
			if(name.length <=1 || hp.length <=3){
				alert('');
				document.paform.name.focus();
				return false;
			}
			
		}
		
		function sendSid(sid){
			alert('sendSid');
			opener.writeform.sid.value = sid;
			self.close();
		}
	</script>
</head>
<body>
	<header class="border-bottom-secondary">
		<form name="paform" action="<%=request.getContextPath()+"/Kids"%>" method="post">
			<input type="hidden" name="command" value="paStSearch">
			<input type="text" name="name" id="name" placeholder="이름">
			<input type="number" name="hp" id="hp" placeholder="휴대폰">
			<a href=""><i></i></a>
			<button class="btn btn-primary" type="submit" onclick="return searchCheck();">검색</button>
		</form>
	</header>
	<div>
		<a href="#" onclick="sendSid('${requestScope.sid}');">${requestScope.sid}</a>
	</div>
</body>
</html>