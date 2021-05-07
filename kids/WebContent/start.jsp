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
	String imsi = "시험용 글씨 써보기";
</body>
</html>