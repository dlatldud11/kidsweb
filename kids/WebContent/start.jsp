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
<<<<<<< HEAD
=======
	뭐했다고 벌써 5시지?!
>>>>>>> branch 'master' of https://github.com/dlatldud11/kidsweb.git
</body>
</html>