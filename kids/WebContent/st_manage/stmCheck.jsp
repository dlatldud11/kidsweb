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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkNo(){
		request.setAttribute("no",1);
		window.close();
	}
</script>
<body>
<div>
일일 관리 입력 하시겠습니까?<br>
${sessionScope.sid}
<input type='BUTTON' value="예" onClick="<%=NoForm%>stmInsert" class="btn btn-info"> 
<button><a href="<%=NoForm%>stmInsert">예2</a></button>
<input type='BUTTON' value="아니오" onClick='checkNo();' class="btn btn-info"> 
</div>
</body>
</html>