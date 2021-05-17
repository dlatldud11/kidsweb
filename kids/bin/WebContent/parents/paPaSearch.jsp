<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>유치원 비밀번호 찾기</title>

	<link href="<%=contextPath %>/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=contextPath %>/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    <script type="text/javascript">
    	function codeCheck(inputcode,pid){
    		var inputcode = document.code.value;
    		if( signaturecode == inputcode){
    			location.href = '/parents/updatePassword.jsp?pid='+pid; //비밀번호 변경 창으로 이동
    		}else{
    			alert('인증코드가 일치하지 않습니다');
    		}
    		
    	}
    </script>
</head>
<body>
<div class="container">
		<div class="card card-primary offset-sm-3 col-sm-6">
			<div class="card-header" align="center">
				<h4>비밀번호 찾기</h4>
			</div>
			<div class="card-body">
				<form action="<%=YesForm %>" method="post">
					<input type="hidden" name="command" value="paPaSearch">
					<div class="form-group">
						<input class="form-control" type="text" name="id" id="id" placeholder="id" required> 
					</div>
					<div class="form-group">
						<input class="form-control" type="email" name="email" id="email" placeholder="email" required> 
					</div>
					<button class="form-control btn btn-primary">인증코드 이메일 전송</button>
				</form>
				<hr>
					<form action="<%=YesForm %>" method="post">
						<input type="hidden" name="command" value="paPaSearch">
						<div class="form-group">
							<input class="form-control" type="text" name="code" id="code" placeholder="code" required> 
						</div>
						<button class="form-control btn btn-primary">인증코드 확인</button>
				    </form>
			</div>
		</div>
	</div>
</body>
</html>