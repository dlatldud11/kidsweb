<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE><html><head></head>
<body> 	
<%
	String imsi = request.getContextPath() + "/Kids?command=" ; 	
	//response.sendRedirect( imsi ) ;
%>
	<a href="<%=imsi%>main">메인</a>
	<br><br><br>
	<a href="<%=imsi%>world">월드</a>

</body>
</html>