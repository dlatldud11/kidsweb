<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE><html><head></head>
<body> 	
<%
	String imsi = request.getContextPath() + "/Kids?command=" ; 	
	//response.sendRedirect( imsi ) ;
%>
	<a href="<%=imsi%>hello">헬로우</a>
	<br><br><br>
	<a href="<%=imsi%>world">월드</a>
	임시영 데스크탑에서 브랜치에서 수정하고 이따가 다시 머지하고 푸시할것임
	이것은 데스크탑에서 로컬 마스터에서 수정한것임 다시 원격 마스터로 푸시 할것임.
	임시영 데스크탑에서 브랜치에서 다시 수정하고 원격으로 푸시할것임
</body>
</html>